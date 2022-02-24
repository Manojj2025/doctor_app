import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/selfcheck_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'package:get/get.dart';

import '../../../widget/toast.dart';

class SelfcheckDetailsView extends GetView<SelfcheckDetailsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SelfcheckDetailsController());
    // int val = controller.messages[0];
    // var test = jsonDecode(controller.messages.toString());
    // print(test[0]['Status'].toString() + 'test');
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.back();
                },
              ),
              Text(
                SelfChecktitle.self,
                style: BaseStyles.whiteMedium15,
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                controller.isButtonUnavailable.value
                    ? null
                    : controller.connected.value
                        ? controller.disconnect()
                        : controller.connect();
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  controller.connected.value ? 'Disconnect' : 'connect',
                  style: BaseStyles.whiteBold15,
                ),
              ),
            )
          ],
          centerTitle: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: controller.isButtonUnavailable.value &&
                  controller.bluetoothState == BluetoothState.STATE_ON,
              child: LinearProgressIndicator(
                backgroundColor: Colors.yellow,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
            ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: controller.chewieController,
              ),
            )),
            heightSpace20,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                controller.item.title,
                style: BaseStyles.mainMedium20,
              ),
            ),
            heightSpace20,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                controller.item.description,
                style: BaseStyles.mainMedium16,
              ),
            ),
            heightSpace20,
            controller.messages.length == 0
                ? Center(
                    child: Text(
                        'Pleases Connect to the Bluetooth And Start Your Test',
                        style: BaseStyles.blackB15))
                : Expanded(
                    child: Obx(() => json
                                .decode(controller.messages[0])['Status'] ==
                            2
                        ? Center(child: CircularProgressIndicator())
                        : json.decode(controller.messages[0])['Status'] == 0
                            ? Center(
                                child: Text('Technical Problem',
                                    style: BaseStyles.blackBold18),
                              )
                            : controller.item.title ==
                                    'Position Sensor Accelerometer'
                                ? PSA()
                                : controller.item.title ==
                                        'Galvanic Skin Response'
                                    ? GSR()
                                    : controller.item.title == 'Airflow Sensor'
                                        ? AS()
                                        : controller.item.title ==
                                                'Oxygen Supply'
                                            ? OS()
                                            : controller.item.title ==
                                                    'Heartbeat'
                                                ? heartbeat()
                                                : controller.item.title ==
                                                        'Fever Test'
                                                    ? fever()
                                                    : controller.item.title ==
                                                            'Oximeter'
                                                        ? Oximeter()
                                                        : controller.item
                                                                    .title ==
                                                                'Sugar Test'
                                                            ? sugertest()
                                                            : BP()))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            controller.sendMessage(controller.s.toString());

            // var mes =
            // Get.to(
            //   () => TextreportView(),
            //   arguments: controller.messages,
            // );
            // controller.messages[1];
            // print(controller.messages[1]);
            // print(controller.messages.toString());
            // controller.enableBluetooth();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.maincolor,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Text(
                  SelfChecktitle.testnow,
                  style: BaseStyles.whiteBold15,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (controller.messages.length == 0) {
                    showToast('Data is null');
                  } else if (json.decode(controller.messages[0])['Status'] ==
                      1) {
                    controller.reportdatasend();
                    print(controller.messages.length.toString() + 'manojtst');
                  } else {
                    showToast('You not send Empty data');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.maincolor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Text(
                    SelfChecktitle.save,
                    style: BaseStyles.whiteBold15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sugertest() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(TableRow(children: [
        TableCell(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Suger Test:',
                style: BaseStyles.black15,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              d['suger'].toString(),
              style: BaseStyles.black15,
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ]));
      return Table(
          border: TableBorder.all(),
          columnWidths: <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth()
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: rows);
    }
  }

  Widget PSA() {
    List<TableRow> rows = [];

    for (int i = 0; i < controller.messages.length; ++i) {
      //   // var item = controller.messages[i];
      print(controller.messages.length);
      var z = jsonDecode(controller.messages[i].toString());
      // print(jsonDecode(controller.hardwaredata[0]['Z-Angle']).toString() +
      // "rrrr");
      //   var d = jsonDecode(controller.messages[i].toString());

      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'X-Angle',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  z['X-Angle'].toString(),
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(TableRow(children: [
        TableCell(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Y-Angle',
                style: BaseStyles.black15,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              z['Y-Angle'].toString(),
              style: BaseStyles.black15,
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ]));
      rows.add(TableRow(children: [
        TableCell(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Z-Angle',
                style: BaseStyles.black15,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              z['Z-Angle'].toString(),
              style: BaseStyles.black15,
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ]));
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  Widget GSR() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Skin',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  d['Skin'].toString(),
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  Widget AS() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Pressure-1',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  d['Pressure-1'].toString(),
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(TableRow(children: [
        TableCell(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Pressure-2',
                style: BaseStyles.black15,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              d['Pressure-2'].toString(),
              style: BaseStyles.black15,
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ]));
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  Widget heartbeat() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    // width: Get.width * 0.90,
                    child: Text(
                      'ECG',
                      style: BaseStyles.black15,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width / 1.5,
                  child: Text(
                    d['ECG'].toString(),
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
          ],
        ),
      );
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  Widget OS() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'ECG',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  d['ECG'].toString(),
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  Widget fever() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Temp:',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  d['Temp.'].toString(),
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  Widget BP() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'BP:',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  d['BP'].toString(),
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  Widget Oximeter() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.messages.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.messages[i].toString());
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Report',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
      rows.add(
        TableRow(
          children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'spo2:',
                    style: BaseStyles.black15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  d['spo2'].toString(),
                  style: BaseStyles.black15,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        ),
      );
    }
    return Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  loading() {
    return Container();
  }
}
