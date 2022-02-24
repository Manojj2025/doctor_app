import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';

import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CallPageController extends GetxController {
  // var pushnotification = Get.find<ConsultController>().pushnotificationC();
  final channelController = TextEditingController(text: 'd');

  /// if channel textField is validated to have error
  final validateError = false.obs;

  ClientRole? role = ClientRole.Broadcaster;
  // var item = Get.arguments['doctor_id'];
  @override
  void onInit() {
    super.onInit();
    // print(item);
    // print(Get.arguments['user_id']);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> onJoin() async {
    // update input validation

    channelController.text.isEmpty
        ? validateError.value = true
        : validateError.value = false;

    if (channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      // var usertype = Get.find<SplashController>().usertype;
      // // print(usertype);
      // if (usertype == 'doctor') {
      //   print(usertype);
      await Get.toNamed(
        '/agoravideo',
      );
      // } else if (usertype == 'patient') {
      //   pushnotificationC();
      //   await Get.toNamed(
      //     '/agoravideo',
      //   );
      // }
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CallPage(
      //       channelName: _channelController.text,
      //       role: _role,
      //     ),
      //   ),
      // );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  pushnotificationC() async {
    try {
      var data = {
        'user_id': Get.arguments['user_id'],
        'doctor_id': Get.arguments['doctor_id'],
        'channel_name': 'd'
      };
      await ApiProvider().pushnotification(data);
      // print(item);
    } catch (e) {
      showToast(e.toString());
    }
  }
}
