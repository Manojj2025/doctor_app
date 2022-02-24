import 'dart:convert';

import 'package:doctor_app/app/modules/patient/controllers/textreport_controller.dart';
import 'package:doctor_app/app/modules/patient/views/testreport_details_view.dart';
import 'package:doctor_app/app/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';

class TestreportView extends GetView<TestreportController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TestreportController());
    controller.patient_latest_checkC();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: appbar('Test Reports', true),
        ),
        body: Obx((() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.loading.value == true
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        controller.bP.length == 0 ||
                                controller.bpdate.value == ''
                            ? noresult(test: "BP")
                            : testreports(
                                "BP",
                                date_time(
                                    controller.bpdate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.bpdate.value
                                        .toString()
                                        .substring(11, 17)),
                                BP()),
                        heightSpace10,
                        controller.suger.length == 0 ||
                                controller.sugerdate.value == ''
                            ? noresult(test: "Sugar Test")
                            : testreports(
                                "Sugar Test",
                                date_time(
                                    controller.sugerdate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.sugerdate.value
                                        .toString()
                                        .substring(11, 17)),
                                sugertest()),

                        heightSpace10,
                        controller.oxi.length == 0 ||
                                controller.oxidate.value == ''
                            ? noresult(test: "Oximeter")
                            : testreports(
                                "Oximeter",
                                date_time(
                                    controller.oxidate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.oxidate.value
                                        .toString()
                                        .substring(11, 17)),
                                Oximeter()),

                        heightSpace10,
                        controller.fever.length == 0 ||
                                controller.feverdate.value == ''
                            ? noresult(test: "Fever Test")
                            : testreports(
                                "Fever Test",
                                date_time(
                                    controller.feverdate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.feverdate.value
                                        .toString()
                                        .substring(11, 17)),
                                fever()),

                        heightSpace10,
                        controller.hb.length == 0 ||
                                controller.hbdate.value == ''
                            ? noresult(test: "Heartbeat")
                            : testreports(
                                "Heartbeat",
                                date_time(
                                    controller.hbdate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.hbdate.value
                                        .toString()
                                        .substring(11, 17)),
                                heartbeat()),
                        heightSpace10,
                        controller.oxygen.length == 0 ||
                                controller.oxygendate.value == ''
                            ? noresult(test: "Oxygen Supply")
                            : testreports(
                                "Oxygen Supply",
                                date_time(
                                    controller.oxygendate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.oxygendate.value
                                        .toString()
                                        .substring(11, 17)),
                                OS()),

                        heightSpace10,
                        controller.air_flow.length == 0 ||
                                controller.air_flowdate.value == ''
                            ? noresult(test: "Airflow Sensor")
                            : testreports(
                                "Airflow Sensor",
                                date_time(
                                    controller.air_flowdate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.air_flowdate.value
                                        .toString()
                                        .substring(11, 17)),
                                AS()),

                        heightSpace10,

                        controller.skin.length == 0 ||
                                controller.skindate.value == ''
                            ? noresult(test: "Galvanic Skin Response")
                            : testreports(
                                "Galvanic Skin Response",
                                date_time(
                                    controller.skindate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.skindate.value
                                        .toString()
                                        .substring(11, 17)),
                                GSR()),
                        heightSpace10,

                        controller.position_sensor.length == 0 ||
                                controller.position_sensordate.value == ''
                            ? noresult(test: "Position Sensor Accelerometer")
                            : testreports(
                                "Position Sensor Accelerometer",
                                date_time(
                                    controller.position_sensordate.value
                                        .toString()
                                        .substring(0, 10),
                                    controller.position_sensordate.value
                                        .toString()
                                        .substring(11, 17)),
                                PSA()),
                        heightSpace10,
                        //
                      ],
                    ),
            ))));
  }

  Card noresult({required test}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 1.0,
              color: AppColors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          children: [
            testtab(
              name: test,
            ),
            heightSpace10,
            Text(
              'No results',
              style: BaseStyles.blackMedium13,
            ),
            heightSpace10
          ],
        ),
      ),
    );
  }

  Card testreports(text, Widget datetime, Widget report) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 1.0,
              color: AppColors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          children: [
            testtab(
              name: text,
            ),
            heightSpace10,
            datetime,

            heightSpace10,
            // BP(),
            report,
            heightSpace10
          ],
        ),
      ),
    );
  }

  Row date_time(date, time) {
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(controller.bpdate.t);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('date:-', style: BaseStyles.blackBold15),
            Text(date.toString(), style: BaseStyles.black15),
          ],
        ),
        Row(
          children: [
            Text('Time:-', style: BaseStyles.blackBold15),
            Text('0${time}', style: BaseStyles.black15),
          ],
        )
      ],
    );
  }

  Row testtab({name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: BaseStyles.mainMedium16,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => TestreportDetailsView(), arguments: {"name": name});
          },
          child: Text(
            "View More",
            style: BaseStyles.mainMedium13,
          ),
        ),
      ],
    );
  }

  Widget PSA() {
    List<TableRow> rows = [];

    for (int i = 0; i < controller.position_sensor.length; ++i) {
      //   // var item = controller.messages[i];
      print(controller.position_sensor.length);
      var z = jsonDecode(controller.position_sensor[i].toString());
      // print(jsonDecode(controller.hardwaredata[0]['Z-Angle']).toString() +
      // "rrrr");
      //   var d = jsonDecode(controller.messages[i].toString());
      controller.position_sensor.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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
    for (int i = 0; i < controller.skin.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.skin[i].toString());
      controller.skin.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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
                  d[i]['Skin'].toString(),
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
    for (int i = 0; i < controller.air_flow.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.air_flow[i].toString());
      controller.air_flow.clear();
      print(controller.air_flow.length);
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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

  Widget OS() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.oxygen.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.oxygen[i].toString());
      controller.oxygen.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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

  Widget heartbeat() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.hb.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.hb[i].toString());
      controller.hb.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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
    for (int i = 0; i < controller.fever.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.fever[i].toString());
      controller.fever.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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

  Widget Oximeter() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.oxi.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.oxi[i].toString());
      controller.oxi.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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

  Widget sugertest() {
    List<TableRow> rows = [];
    for (int i = 0; i < controller.suger.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.suger[i].toString());
      controller.suger.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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
    for (int i = 0; i < controller.bP.length; ++i) {
      // var item = controller.messages[i];
      var d = jsonDecode(controller.bP[i].toString());
      controller.bP.clear();
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
                    style: BaseStyles.blackB15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Value',
                  style: BaseStyles.blackB15,
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
}
