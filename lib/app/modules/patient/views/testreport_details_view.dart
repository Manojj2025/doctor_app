import 'dart:convert';

import 'package:doctor_app/app/modules/patient/controllers/testreport_details_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';

class TestreportDetailsView extends GetView<TestreportDetailsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TestreportDetailsController());
    controller.patient_old_checkC();
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          children: [
            controller.type == 'BP'
                ? testdetail(
                    'BP',
                    controller.history.length == 0
                        ? Center(
                            child: Text(
                              'No results',
                              style: BaseStyles.blackMedium13,
                            ),
                          )
                        : BP())
                : controller.type == 'Sugar Test'
                    ? testdetail(
                        'Sugar Test',
                        controller.history.length == 0
                            ? Center(
                                child: Text(
                                  'No results',
                                  style: BaseStyles.blackMedium13,
                                ),
                              )
                            : sugertest())
                    : controller.type == 'Oximeter'
                        ? testdetail(
                            'Oximeter',
                            controller.history.length == 0
                                ? Center(
                                    child: Text(
                                      'No results',
                                      style: BaseStyles.blackMedium13,
                                    ),
                                  )
                                : Oximeter())
                        : controller.type == 'Fever Test'
                            ? testdetail(
                                'Fever Test',
                                controller.history.length == 0
                                    ? Center(
                                        child: Text(
                                          'No results',
                                          style: BaseStyles.blackMedium13,
                                        ),
                                      )
                                    : fever())
                            : controller.type == 'Heartbeat'
                                ? testdetail(
                                    'Heartbeat',
                                    controller.history.length == 0
                                        ? Center(
                                            child: Text(
                                              'No results',
                                              style: BaseStyles.blackMedium13,
                                            ),
                                          )
                                        : heartbeat())
                                : controller.type == 'Oxygen Supply'
                                    ? testdetail(
                                        'Oxygen Supply',
                                        controller.history.length == 0
                                            ? Center(
                                                child: Text(
                                                  'No results',
                                                  style:
                                                      BaseStyles.blackMedium13,
                                                ),
                                              )
                                            : OS())
                                    : controller.type == 'Airflow Sensor'
                                        ? testdetail(
                                            'Airflow Sensor',
                                            controller.history.length == 0
                                                ? Center(
                                                    child: Text(
                                                      'No results',
                                                      style: BaseStyles
                                                          .blackMedium13,
                                                    ),
                                                  )
                                                : AS())
                                        : controller.type ==
                                                'Galvanic Skin Response'
                                            ? testdetail(
                                                'Galvanic Skin Response',
                                                controller.history.length == 0
                                                    ? Center(
                                                        child: Text(
                                                          'No results',
                                                          style: BaseStyles
                                                              .blackMedium13,
                                                        ),
                                                      )
                                                    : GSR())
                                            : testdetail(
                                                'Position Sensor Accelerometer',
                                                controller.history.length == 0
                                                    ? Center(
                                                        child: Text(
                                                          'No results',
                                                          style: BaseStyles
                                                              .blackMedium13,
                                                        ),
                                                      )
                                                    : PSA())
          ],
        ),
      ),
    );
  }

  // Widget noresult() {
  //   return
  //       // Text(name),
  //       Text(
  //     'No results',
  //     style: BaseStyles.blackMedium13,
  //   );
  // }

  testdetail(
    name,
    Widget hlist,
  ) {
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
            Text(name, style: BaseStyles.mainMedium20),
            heightSpace10,
            hlist,
            heightSpace10
          ],
        ),
      ),
    );
  }

  Widget PSA() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'X-Angle',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['X-Angle'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'Y-Angle',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['Y-Angle'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'Z-Angle',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['Z-Angle'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Padding date_time(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Date:',
                style: BaseStyles.blackBold15,
              ),
              Text(
                controller.history[index]['datetime']
                    .toString()
                    .substring(0, 10),
                style: BaseStyles.black15,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Time:',
                style: BaseStyles.blackBold15,
              ),
              Text(
                controller.history[index]['datetime']
                    .toString()
                    .substring(11, 17),
                style: BaseStyles.black15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget GSR() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'Skin',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['Skin'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget AS() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final date = controller.history[index]['created_at'];
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'Pressure-1',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['Pressure-1'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'Pressure-2',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['Pressure-2'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget OS() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'ECG',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['ECG'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget heartbeat() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'ECG',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['ECG'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget fever() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'Temp',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['Temp.'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget Oximeter() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'spo2',
                          style: BaseStyles.black15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          d['spo2'].toString(),
                          style: BaseStyles.black15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget sugertest() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'Suger Test',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['suger'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget BP() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.history.length,
        itemBuilder: (BuildContext context, int index) {
          final data = controller.history[index]['report'];
          var d = jsonDecode(controller.history[index]['report'].toString());
          // print(controller.withdraw[index]['appointment_id'].toString());
          print(data.toString());
          return Card(
            child: Container(
              padding: EdgeInsets.all(5.0),
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
                  date_time(index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: Get.width * 0.40,
                        alignment: Alignment.center,
                        child: Text(
                          'Report',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: Get.width * 0.40,
                        child: Text(
                          'Value',
                          style: BaseStyles.blackBold15,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width * 0.40,
                            alignment: Alignment.center,
                            child: Text(
                              'BP',
                              style: BaseStyles.black15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: Get.width * 0.40,
                            child: Text(
                              d['BP'].toString(),
                              style: BaseStyles.black15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
