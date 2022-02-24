import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/patientdirectory_controller.dart';
import 'package:doctor_app/app/widget/appbar.dart';
import 'package:doctor_app/app/widget/column_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PatientdirectoryView extends GetView<PatientdirectoryController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PatientdirectoryController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appbar('Patient Directory', true),
        centerTitle: false,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     // Get.dialog(
      //     //   Dialog(
      //     //     shape: RoundedRectangleBorder(
      //     //         borderRadius: BorderRadius.circular(20.0)), //this right here
      //     //     child: Padding(
      //     //       padding: const EdgeInsets.all(12.0),
      //     //       child: Column(
      //     //         mainAxisSize: MainAxisSize.min,
      //     //         mainAxisAlignment: MainAxisAlignment.start,
      //     //         crossAxisAlignment: CrossAxisAlignment.start,
      //     //         children: [
      //     //           //     Obx(
      //     //           //   () => Expanded(
      //     //           //     child: controller.patientLoading.value
      //     //           //         ? Center(child: Text('Patient loading...'))
      //     //           //         : controller.patientList.length > 0
      //     //           //             ? appointmentFor()
      //     //           //             : Center(
      //     //           //                 child: Text(
      //     //           //                   'No Patients',
      //     //           //                   style: TextStyle(
      //     //           //                     fontWeight: FontWeight.bold,
      //     //           //                     fontSize: 17,
      //     //           //                   ),
      //     //           //                 ),
      //     //           //               ),
      //     //           //   ),
      //     //           // ),

      //     //           Row(
      //     //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //             children: [
      //     //               Expanded(
      //     //                 child: ElevatedButton(
      //     //                   // style: ButtonStyle(
      //     //                   //   backgroundColor: MaterialStateProperty.all<Color>(
      //     //                   //     Colors.grey[600],
      //     //                   //   ),
      //     //                   // ),
      //     //                   onPressed: () {
      //     //                     Get.back();
      //     //                   },
      //     //                   child: Text('Cancle'),
      //     //                 ),
      //     //               ),
      //     //               SizedBox(width: 20),
      //     //               Expanded(
      //     //                 child: ElevatedButton(
      //     //                   style: ButtonStyle(
      //     //                     backgroundColor: MaterialStateProperty.all<Color>(
      //     //                       Colors.green,
      //     //                     ),
      //     //                   ),
      //     //                   onPressed: () {
      //     //                     // controller.addPatient();
      //     //                   },
      //     //                   child: Text('Add'),
      //     //                 ),
      //     //               ),
      //     //             ],
      //     //           )
      //     //         ],
      //     //       ),
      //     //     ),
      //     //   ),
      //     // );
      //   },
      // ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        alignment: Alignment.center,
        child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.maincolor,
              ),
              child: Text(
                'Add',
                style: BaseStyles.whiteBold13,
              ),
            )),
      ),
      body: Obx(
        () => ListView(
          children: [
            Obx(
              () {
                return controller.patientList.length > 0
                    ? ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(fixPadding * 2.0),
                            child: ColumnBuilder(
                              itemCount: controller.patientList.length,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              itemBuilder: (context, index) {
                                final item = controller.patientList[index];
                                return Container(
                                  margin: (index == 0)
                                      ? EdgeInsets.only(top: 0.0)
                                      : EdgeInsets.only(top: fixPadding * 2.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 70.0,
                                              height: 70.0,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius:
                                                    BorderRadius.circular(35.0),
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  child: Image.asset(
                                                      'assets/icon.png'),
                                                ),
                                              ),
                                            ),
                                            widthSpace20,
                                            Expanded(
                                              child: Text(
                                                item['patient_name'],
                                                style: BaseStyles.blackBold13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red[800],
                                        ),
                                        onPressed: () {
                                          Get.dialog(
                                            Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)), //this right here
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        'Delete Patient',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      'Do you really want to delete this patient',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            // style: ButtonStyle(
                                                            //   backgroundColor:
                                                            //       MaterialStateProperty
                                                            //           .all<Color>(
                                                            //     Colors.grey[600],
                                                            //   ),
                                                            // ),
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child:
                                                                Text('Cancle'),
                                                          ),
                                                        ),
                                                        SizedBox(width: 20),
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all<
                                                                          Color>(
                                                                Colors.red,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              // controller
                                                              //     .deletePatient(
                                                              //         item['_id']);
                                                            },
                                                            child:
                                                                Text('Delete'),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text('No Patients'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  decoration({@required color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 0.1,
          blurRadius: 5,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }
}
