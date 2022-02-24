import 'package:doctor_app/app/constants/constants.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/doctorappintmnetprofiledetails_controller.dart';
import 'package:doctor_app/app/modules/patient/views/message_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DoctorappintmnetprofiledetailsView
    extends GetView<DoctorappintmnetprofiledetailsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DoctorappintmnetprofiledetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Dr.${controller.doctordetails['doctor_name'].toString()}'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height * 0.36,
            color: AppColors.maincolor,
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: Get.width * 0.30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr.' + controller.doctordetails['doctor_name'],
                        style: BaseStyles.whiteBold15,
                      ),
                      heightSpace10,
                      Text(
                        controller.doctordetails['education'],
                        style: BaseStyles.whiteBold15,
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: '1',
                  child: controller.doctordetails['doctorImage'] != null
                      ? Image.network(
                          '${controller.url}/${controller.doctordetails['doctorImage'].toString()}',
                          width: Get.width / 2.0,
                          height: Get.height / 3.2,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/icons/default_doctor.png',
                          width: Get.width / 2.0,
                          height: Get.height / 3.2,
                          fit: BoxFit.contain,
                        ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder: (BuildContext context, myscrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                child: Container(
                  color: AppColors.whiteColor,
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: ListView(
                    controller: myscrollController,
                    children: [
                      // Text(
                      //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      //   style: greyNormalTextStyle,
                      //   textAlign: TextAlign.justify,
                      // ),
                      // heightSpace,
                      heightSpace10,
                      experience(),
                      heightSpace20,

                      // availability(controller.doctor),
                      // heightSpace20,
                      // location(),
                      experties(),
                      heightSpace20,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print(getpatientid().toString());
                              // print(getdoctorid().toString());
                              Constants.receivedid = controller
                                  .doctordetails['doctor_id']
                                  .toString();
                              Get.to(() => MessageList(
                                  sendID: Constants.sendid,
                                  receiverID: Constants.receivedid
                                  // = controller
                                  //     .booked[index]['doctor_id']
                                  //     .toString()
                                  ));
                              // Get.to(() => Chat(chatRoomId: '2'));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: AppColors.maincolor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                'Chat',
                                style: BaseStyles.whiteBold15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  experience() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Experience',
              style: BaseStyles.blackBold14,
            ),
            Row(
              children: [
                Text(
                  'BookingType: ',
                  style: BaseStyles.blackBold14,
                ),
                Text(
                  '${controller.doctordetails['bookingType'].toString()}',
                  style: BaseStyles.grey15,
                ),
              ],
            ),
          ],
        ),
        heightSpace10,
        Text(
          '${controller.doctordetails['experience']} Years',
          style: BaseStyles.grey15,
        ),
        heightSpace20,
        Row(
          children: [
            Text(
              'Doctor Charges:',
              style: BaseStyles.blackBold14,
            ),
            Text(
              '\₹${controller.doctordetails['fees'].toString()} Charges',
              style: BaseStyles.grey15,
            ),
          ],
        ),
        heightSpace20,
        Wrap(
          children: [
            heightSpace20,
            Text(
              'Doctor Specilist: ',
              style: BaseStyles.blackBold14,
            ),
            Text(
              '${controller.doctordetails['specilist'].toString()}',
              style: BaseStyles.grey15,
            ),
          ],
        )
      ],
    );
  }

  experties() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experties',
          style: BaseStyles.blackBold14,
        ),
        heightSpace10,
        Text(
          '${controller.doctordetails['education']}',
          style: BaseStyles.grey15,
        ),
        heightSpace20,
        Row(
          children: [
            Text(
              'Date: ',
              style: BaseStyles.blackBold14,
            ),
            Text(
              '${controller.doctordetails['date'].toString()}',
              style: BaseStyles.grey15,
            ),
          ],
        ),
        heightSpace10,
        Row(
          children: [
            Text(
              'time: ',
              style: BaseStyles.blackBold14,
            ),
            Text(
              '${controller.doctordetails['time'].toString()}',
              style: BaseStyles.grey15,
            ),
          ],
        ),
      ],
    );
  }
}
