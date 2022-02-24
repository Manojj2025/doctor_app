import 'dart:convert';
import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:doctor_app/app/widget/toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../widget/please_wait.dart';
import '../providers/api_provider_provider.dart';

class SelfcheckDetailsController extends GetxController {
  late VideoPlayerController videoplayer;
  late ChewieController chewieController;
  var s = Get.arguments['data2'];
  var item = Get.arguments['item'];
  var videourl = Get.arguments['imagepathself'];
  final loading = true.obs;
  final futureloading = true.obs;
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;

  final ScrollController listScrollController = new ScrollController();
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection? connection;

  final deviceState = 0.obs;

  final isDisconnecting = false.obs;

  bool get isConnected => connection != null && connection!.isConnected;
  final load = true.obs;
  final messages = [].obs;
  final hardwaredata = [].obs;
  BluetoothDevice? device;
  final connected = false.obs;
  final isButtonUnavailable = false.obs;
  final isConnecting = true.obs;
  final messageBuffer = ''.obs;
  @override
  void onInit() {
    super.onInit();

    enableBluetooth();
    connect();

    videoplayer = VideoPlayerController.network('${videourl}/${item.videourl}',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    videoplayer.play();
    videoplayer.initialize();
    videoplayer.setLooping(true);
    chewieController = ChewieController(
        videoPlayerController: videoplayer,
        autoInitialize: false,
        autoPlay: false,
        placeholder: Container(
          color: Colors.black,
        ));
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting.value = true;
      connection!.dispose();
      connection = null;
    }
    super.dispose();
    videoplayer.dispose();
    chewieController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    // show5second();
  }

  @override
  void onClose() {
    videoplayer.dispose();
    chewieController.dispose();
  }

  enableBluetooth() async {
    // Retrieving the current Bluetooth state
    bluetoothState = await FlutterBluetoothSerial.instance.state;

    // If the bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      // await connect();
      return true;
    } else {
      // await print('Make Sure Your Device is Connected');
      print('Make Sure Your Device is Connected');
    }
    return false;
  }

  disconnect() async {
    isButtonUnavailable.value = true;
    // deviceState.value = 0;

    await connection!.close();
    showToast('Device disconnected');
    if (!connection!.isConnected) {
      connected.value = false;
      isButtonUnavailable.value = false;
    }
  }

  connect() async {
    isButtonUnavailable.value = true;

    if (!isConnected) {
      await BluetoothConnection.toAddress('FC:A8:9A:00:21:0B')
          .then((_connection) {
        print('Connected to the device');
        connection = _connection;

        connected.value = true;

        connection!.input!.listen(onDataReceived).onDone(() {
          if (isDisconnecting.value) {
            print(connection!.input);
            print('Disconnecting locally!');
          } else {
            print('Disconnected remotely!');
          }
        });
      }).catchError((error) {
        print('Cannot connect, exception occurred');
        print(error);
      });
      print('Device connected');
      // print('hello');

      isButtonUnavailable.value = false;
    }
  }

  void onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data

    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;
    // print(bufferIndex);
    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      messages.clear();

      messages.add(
        backspacesCounter > 0
            ? messageBuffer.value
                .substring(0, messageBuffer.value.length - backspacesCounter)
            : messageBuffer.value + dataString.substring(0, index),
      );

      print(messages.toString() + 'manoj222 ');
      messageBuffer.value = dataString.substring(index);
      print(messageBuffer.value);
    } else {
      messageBuffer.value = (backspacesCounter > 0
          ? messageBuffer.value
              .substring(0, messageBuffer.value.length - backspacesCounter)
          : messageBuffer.value + dataString);
    }
  }

  sendMessage(String text) async {
    text = text.trim();

    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text + "\r\n")));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state
        showToast(e.toString());
      }
    }
  }

  reportdatasend() async {
    pleaseWait();
    var data = {
      'type': item.title.toString(),
      'report':
          messages.length == 0 ? messages.toString() : messages[0].toString(),
      'name': 'manoj'
    };

    try {
      hardwaredata.clear();
      await ApiProvider().hardware_postP(data);
      Get.back();
      showToast('Your Report Has been successfully save');
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
      Get.back();
    }
  }
}
