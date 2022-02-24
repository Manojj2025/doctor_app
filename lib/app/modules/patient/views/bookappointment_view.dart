import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/bookappointment_controller.dart';
import 'package:doctor_app/app/widget/appbar.dart';
import 'package:doctor_app/app/widget/column_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookappointmentView extends GetView<BookappointmentController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BookappointmentController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appbar('Book Appointment', true),
        centerTitle: false,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        alignment: Alignment.center,
        child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: () {
              if (controller.id.value == 1) {
                controller.accountSelf_c();
              } else {
                controller.accountOther_c();
              }
              // print(controller.patientList.length);
              // if (controller.patientList.length > 0) {
              //   Get.to(
              //     PaymentView(),
              //     arguments: {
              //       'date_time': controller.dateTime.millisecondsSinceEpoch,
              //       'consultation_charge':
              //           controller.doctor['consultation_charge'],
              //       'doctor_id': controller.doctor['_id'],
              //       'patient_ids': controller.selectedpatientList,
              //     },
              //   );
              // } else {,
              // Get.toNamed('/addpatient', arguments: {'doctor': Get.arguments});
              // }
            },
            child: Container(
              width: double.infinity,
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.maincolor,
              ),
              child: Text(
                'Book Appointment',
                style: BaseStyles.whiteBold13,
              ),
            )),
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 1.0,
                    child: Container(
                      color: AppColors.whiteColor,
                      padding: EdgeInsets.only(
                          top: fixPadding * 2.0, bottom: fixPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: fixPadding * 2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: '123',
                                  // tag: widget.doctorImage,
                                  child: Container(
                                    width: 76.0,
                                    height: 76.0,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(38.0),
                                      border: Border.all(
                                          width: 0.3,
                                          color: AppColors.whiteColor),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          color: Colors.grey.shade300,
                                        ),
                                      ],
                                      image: DecorationImage(
                                        scale: 1.5,
                                        image: NetworkImage(
                                          '${controller.url}/${controller.doctor['profileImage'].toString()}',
                                        ),
                                        fit: BoxFit.fitHeight,
                                        // scale: 5,
                                      ),
                                    ),
                                  ),
                                ),
                                widthSpace20,
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${controller.doctor['username'].toString()}",
                                              style: BaseStyles.blackBold13,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          // Wrap(
                                          //   children: [
                                          //     InkWell(
                                          //       onTap: () {
                                          //         // Navigator.push(
                                          //         //     context,
                                          //         //     PageTransition(
                                          //         //         duration: Duration(
                                          //         //             milliseconds: 600),
                                          //         //         type: PageTransitionType.fade,
                                          //         //         child: DoctorProfile(
                                          //         //           doctorImage:
                                          //         //               widget.doctorImage,
                                          //         //           doctorName:
                                          //         //               widget.doctorName,
                                          //         //           doctorType:
                                          //         //               widget.doctorType,
                                          //         //           experience:
                                          //         //               widget.doctorExp,
                                          //         //         )));
                                          //       },
                                          //       child: Text(
                                          //         'View Profile',
                                          //         style: BaseStyles.blackBold13,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                      SizedBox(height: 7.0),
                                      Text(
                                        '${controller.doctor['education'].toString()}',
                                        style: BaseStyles.blackBold13,
                                      ),
                                      SizedBox(height: 7.0),
                                      Text(
                                        '${controller.doctor['experience'].toString()}',
                                        style: BaseStyles.blackBold13,
                                      ),
                                      SizedBox(height: 7.0),
                                      Text(
                                        '\₹${controller.doctor['amount'].toString()} consultation charge',
                                        style: BaseStyles.blackBold13,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          heightSpace20,
                          Container(
                            width: double.infinity,
                            height: 0.7,
                            color: AppColors.grey.withOpacity(0.4),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: fixPadding,
                                right: fixPadding * 2.0,
                                left: fixPadding * 2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      size: 18.0,
                                      color: AppColors.grey,
                                    ),
                                    widthSpace20,
                                    Text(
                                      '${controller.date.toString().substring(0, 10)}',
                                      style: BaseStyles.blackMedium13,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 18.0,
                                      color: AppColors.grey,
                                    ),
                                    widthSpace20,
                                    Text(
                                      '${controller.time.toString()}',
                                      style: BaseStyles.blackMedium13,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Obx(
                  //   () => Expanded(
                  //     child: controller.patientLoading.value
                  //         ? Center(child: Text('Patient loading...'))
                  //         : controller.patientList.length > 0
                  //             ? appointmentFor()
                  //             : Center(
                  //                 child: Text(
                  //                   'No Patients',
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 17,
                  //                   ),
                  //                 ),
                  //               ),
                  //   ),
                  // ),

                  // heightSpace10
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Self',
                                  style: BaseStyles.black15,
                                ),
                                Radio(
                                    activeColor: AppColors.maincolor,
                                    value: 1,
                                    groupValue: controller.id.value,
                                    onChanged: (index) {
                                      controller.id.value = 1;
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Other',
                                  style: BaseStyles.black15,
                                ),
                                Radio(
                                    activeColor: AppColors.maincolor,
                                    value: 2,
                                    groupValue: controller.id.value,
                                    onChanged: (index) {
                                      controller.id.value = 2;
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  controller.id.value == 1
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Name',
                                      style: BaseStyles.black15,
                                    ),
                                    heightSpace10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: AppColors.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            )
                                          ],
                                        ),
                                        width: Get.width * 0.85,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextField(
                                          controller: controller.selfnamed,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your Name',
                                          ),
                                        )),
                                    heightSpace20,
                                    Text(
                                      'Age',
                                      style: BaseStyles.black15,
                                    ),
                                    heightSpace10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: AppColors.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            )
                                          ],
                                        ),
                                        width: Get.width * 0.45,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextField(
                                          controller: controller.selfage,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your Age',
                                          ),
                                        )),
                                    // heightSpace20,
                                    // Text(
                                    //   'Gender',
                                    //   style: BaseStyles.black15,
                                    // ),
                                    heightSpace10,
                                    Text(CustomerProfile.gender,
                                        style: BaseStyles.black15),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.selfgender.value =
                                                  "Female";
                                            },
                                            child: Container(
                                              width: Get.width * 0.25,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 0.2,
                                                    blurRadius: 1,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  )
                                                ],
                                                color: controller
                                                            .selfgender.value ==
                                                        "Female"
                                                    ? Get.theme.primaryColor
                                                    : Colors.white,
                                              ),
                                              child: Text(
                                                CustomerProfile.Female,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: controller.selfgender
                                                              .value ==
                                                          "Female"
                                                      ? AppColors.whiteColor
                                                      : AppColors.blacklight,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.selfgender.value =
                                                  "Male";
                                            },
                                            child: Container(
                                              width: Get.width * 0.25,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 0.2,
                                                    blurRadius: 1,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  )
                                                ],
                                                color: controller
                                                            .selfgender.value ==
                                                        "Male"
                                                    ? Get.theme.primaryColor
                                                    : Colors.white,
                                              ),
                                              child: Text(
                                                CustomerProfile.male,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: controller.selfgender
                                                              .value ==
                                                          "Male"
                                                      ? AppColors.whiteColor
                                                      : AppColors.blacklight,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.selfgender.value =
                                                  "Other";
                                            },
                                            child: Container(
                                              width: Get.width * 0.25,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 0.2,
                                                    blurRadius: 1,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  )
                                                ],
                                                color: controller
                                                            .selfgender.value ==
                                                        "Other"
                                                    ? Get.theme.primaryColor
                                                    : Colors.white,
                                              ),
                                              child: Text(
                                                CustomerProfile.other,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: controller.selfgender
                                                              .value ==
                                                          "Other"
                                                      ? AppColors.whiteColor
                                                      : AppColors.blacklight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])))
                      : Container(),
                  controller.id.value == 2
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Name',
                                      style: BaseStyles.black15,
                                    ),
                                    heightSpace10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: AppColors.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            )
                                          ],
                                        ),
                                        width: Get.width * 0.85,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextField(
                                          controller: controller.othername,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your Name',
                                          ),
                                        )),
                                    heightSpace20,
                                    Text(
                                      'Age',
                                      style: BaseStyles.black15,
                                    ),
                                    heightSpace10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: AppColors.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            )
                                          ],
                                        ),
                                        width: Get.width * 0.45,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextField(
                                          controller: controller.otherage,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your Age',
                                          ),
                                        )),
                                    heightSpace20,
                                    Text(
                                      'Gender',
                                      style: BaseStyles.black15,
                                    ),
                                    heightSpace10,
                                    Obx(() => Container(
                                          child: Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.othergender
                                                        .value = "Female";
                                                  },
                                                  child: Container(
                                                    width: Get.width * 0.25,
                                                    height: 40,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 0.2,
                                                          blurRadius: 1,
                                                          offset: Offset(0,
                                                              1), // changes position of shadow
                                                        )
                                                      ],
                                                      color: controller
                                                                  .othergender
                                                                  .value ==
                                                              "Female"
                                                          ? Get.theme
                                                              .primaryColor
                                                          : Colors.white,
                                                    ),
                                                    child: Text(
                                                      'Female',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: controller
                                                                    .othergender
                                                                    .value ==
                                                                "Female"
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .blacklight,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                widthSpace10,
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.othergender
                                                        .value = "Male";
                                                  },
                                                  child: Container(
                                                    width: Get.width * 0.25,
                                                    height: 40,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      color: controller
                                                                  .othergender
                                                                  .value ==
                                                              "Male"
                                                          ? Get.theme
                                                              .primaryColor
                                                          : Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 0.2,
                                                          blurRadius: 1,

                                                          offset: Offset(0,
                                                              1), // changes position of shadow
                                                        )
                                                      ],
                                                    ),
                                                    child: Text(
                                                      'Male',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: controller
                                                                    .othergender
                                                                    .value ==
                                                                "Male"
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .blacklight,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                widthSpace10,
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.othergender
                                                        .value = "Other";
                                                  },
                                                  child: Container(
                                                    width: Get.width * 0.25,
                                                    height: 40,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      color: controller
                                                                  .othergender
                                                                  .value ==
                                                              "Other"
                                                          ? Get.theme
                                                              .primaryColor
                                                          : Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 0.2,
                                                          blurRadius: 1,

                                                          offset: Offset(0,
                                                              1), // changes position of shadow
                                                        )
                                                      ],
                                                    ),
                                                    child: Text(
                                                      CustomerProfile.other,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: controller
                                                                    .othergender
                                                                    .value ==
                                                                "Other"
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .blacklight,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        )),
                                    heightSpace20,
                                    Text(
                                      'Relation',
                                      style: BaseStyles.black15,
                                    ),
                                    heightSpace10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: AppColors.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            )
                                          ],
                                        ),
                                        width: Get.width * 0.85,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextField(
                                          controller: controller.otherelation,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Enter your Relation With patient',
                                          ),
                                        )),
                                  ])))
                      : Container(),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Yours Symptoms',
                          style: BaseStyles.blackBold15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0)), //this right here
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Center(
                                      //   child: Text(
                                      //     'Add Patient',
                                      //     style: TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 20,
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: controller.other_symptoms,
                                        cursorColor: Colors.black,
                                        // keyboardType: inputType,
                                        decoration: new InputDecoration(
                                          fillColor: Colors.grey[200],
                                          filled: true,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                          hintText: 'Enter Other Symptoms',
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(
                                                  AppColors.maincolor,
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text('Cancel'),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(
                                                  AppColors.maincolor,
                                                ),
                                              ),
                                              onPressed: () {
                                                // controller.addPatient();

                                                // addother();

                                                controller.othersys.add(
                                                    controller
                                                        .other_symptoms.text);
                                                Get.back();
                                                controller.other_symptoms
                                                    .clear();
                                              },
                                              child: Text('Add'),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )));
                          },
                          child: Text(
                            '+ Other',
                            style: BaseStyles.blackBold13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // patientadd()
                  selectdiseases(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Text(
                      'Other Symptoms',
                      style: BaseStyles.blackBold15,
                    ),
                  ),
                  controller.othersys.length == 0 ? Container() : addother()
                  // other_symptoms()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // patientadd() {
  //   return Card(
  //     child: ListView(
  //       shrinkWrap: true,
  //       children: [
  //         selectdiseases(),
  //         heightSpace10,
  //       ],
  //     ),
  //   );
  // }

  selectdiseases() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.symptomsdata.length,
        itemBuilder: (context, index) {
          var d = controller.symptomsdata[index]['name'];
          return Obx(
            () => Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    // print(controller.select_symptoms);
                    if (!controller.select_symptoms
                        .contains(controller.symptomsdata[index])) {
                      controller.select_symptoms
                          .add(controller.symptomsdata[index]);
                      print(controller.select_symptoms);
                    } else {
                      controller.select_symptoms
                          .remove(controller.symptomsdata[index]);
                    }
                  },
                  child: Container(
                    // height: 60,
                    width: Get.width * 0.85,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.select_symptoms
                                  .contains(controller.symptomsdata[index])
                              ? Get.theme.primaryColor
                              : AppColors.blackColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Stack(children: [
                        Center(
                          child: Text(
                            d.toString(),
                            style: BaseStyles.blackBold13,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                controller.select_symptoms
                        .contains(controller.symptomsdata[index])
                    ? Positioned(
                        right: 50,
                        top: 10,
                        child: Icon(
                          Icons.check,
                          color: Get.theme.primaryColor,
                        ))
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  addother() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.othersys.length,
        itemBuilder: (context, index) {
          print(controller.othersys[index]);
          // var d = controller.symptomsdata[index]['name'];
          return Obx(
            () => Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    // print(controller.select_symptoms);
                    if (!controller.select_symptoms_other
                        .contains(controller.othersys[index])) {
                      controller.select_symptoms_other
                          .add(controller.othersys[index]);
                      print(controller.select_symptoms);
                    } else {
                      controller.select_symptoms_other
                          .remove(controller.othersys[index]);
                    }
                  },
                  child: Container(
                    // height: 60,
                    width: Get.width * 0.85,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.select_symptoms_other
                                  .contains(controller.othersys[index])
                              ? Get.theme.primaryColor
                              : AppColors.blackColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Stack(children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.othersys[index],
                                style: BaseStyles.blackBold13,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                controller.select_symptoms_other
                        .contains(controller.othersys[index])
                    ? Positioned(
                        right: 50,
                        top: 10,
                        child: Icon(
                          Icons.check,
                          color: Get.theme.primaryColor,
                        ))
                    : Positioned(
                        right: 50,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            controller.othersys.removeAt(index);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Get.theme.primaryColor,
                          ),
                        ))
              ],
            ),
          );
        },
      ),
    );
  }

  appointmentFor() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(fixPadding * 2.0),
          child: ColumnBuilder(
            itemCount: 5,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // if (controller.selectedpatientList.contains(item['_id'])) {
                  //   controller.selectedpatientList.remove(item['_id']);
                  // } else {
                  //   controller.selectedpatientList.add(item['_id']);
                  // }
                },
                child: Container(
                  margin: (index == 0)
                      ? EdgeInsets.only(top: 0.0)
                      : EdgeInsets.only(top: fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset('assets/icon.png'),
                          ),
                        ),
                      ),
                      widthSpace20,
                      Expanded(
                        child: Text(
                          'patient_name',
                          style: BaseStyles.blackMedium13,
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.maincolor,
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 12,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
