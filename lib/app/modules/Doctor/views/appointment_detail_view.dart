import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/app/agora_video/views/call_page_view.dart';
import 'package:doctor_app/app/constants/constants.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/appointment_detail_controller.dart';
import 'package:doctor_app/app/modules/patient/views/message_list.dart';
import 'package:doctor_app/app/widget/appbar.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppointmentDetailView extends GetView<AppointmentDetailController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AppointmentDetailController());
    controller.DoctorappointmentdC();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: appbar('Details', true),
          centerTitle: false,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => CallPageView(), arguments: {
                'user_id': controller.patientlist['user_id'],
                'doctor_id': controller.patientlist['doctorId']
              });

              print(controller.patientlist['doctorId']);
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
                'Video Call',
                style: BaseStyles.whiteBold13,
              ),
            ),
          ),
        ),
        body: Obx(
          () => ListView(
            children: [doctor_detail()],
          ),
        ));
  }

  doctor_detail() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Patient Detail',
                style: BaseStyles.mainBold18,
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                height: 4,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.maincolor),
              ),
            ],
          ),
          heightSpace10,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.whiteColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  color: AppColors.maincolor.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.patientlist['name'].toString(),
                        style: BaseStyles.blackB15,
                      ),
                      Text(
                        controller.patientlist['mobile'].toString(),
                        style: BaseStyles.blackBold15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Age :- ${controller.patientlist['age'].toString()}',
                        style: BaseStyles.blackBold15,
                      ),
                      Text(
                        'Gender :- ${controller.patientlist['gender'].toString()}',
                        style: BaseStyles.blackBold15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    controller.patientlist['email'].toString(),
                    style: BaseStyles.blackB15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Time Slot :- ${controller.patientlist['timeSlot'].toString()}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greencolor),
                  ),
                ),
              ],
            ),
          ),
          heightSpace20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Booking Detail',
                style: BaseStyles.mainBold18,
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                height: 4,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.maincolor),
              ),
            ],
          ),
          heightSpace20,
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.whiteColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  color: AppColors.maincolor.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Booking Number :- ${controller.patientlist['bookingNumber'].toString()}',
                    style: BaseStyles.blackB15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Booking Date :- ${controller.patientlist['BookingDate'].toString()}',
                    style: BaseStyles.blackB15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Symptoms :- ${controller.patientlist['symptoms'].toString()}',
                    style: BaseStyles.blackB15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Other Symptoms :- ${controller.patientlist['other_Symptoms'].toString()}',
                    style: BaseStyles.blackB15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Fee:- ${controller.patientlist['amount'].toString()}',
                    style: BaseStyles.blackB15,
                  ),
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         Constants.receivedid =
          //             controller.patientlist['user_id'].toString();
          //         Get.to(() => MessageList(
          //             sendID: Constants.sendid,
          //             receiverID: Constants.receivedid));
          //       },
          //       child: Container(
          //         alignment: Alignment.center,
          //         height: 30,
          //         width: 100,
          //         decoration: BoxDecoration(
          //             color: AppColors.maincolor,
          //             borderRadius: BorderRadius.circular(5)),
          //         child: Text(
          //           'Chat',
          //           style: BaseStyles.whiteBold15,
          //         ),
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

//   sendMessage() {
//     // String username = 'Manoj jangid';
//     List<String> users = ['aaaa', 'manoj jangid'];
//     print(users);
//     // print(userName);
//     String chatRoomId = getchatRoomId('aaaa', 'manoj jangid');

//     Map<String, dynamic> chatRoom = {
//       "data": users,
//       "chatRoomId": chatRoomId,
//     };
//     print(chatRoomId);
//     DatabaseMethods().addChatRoom(chatRoom, chatRoomId);

//     Get.to(() => Chat(
//           chatRoomId: chatRoomId,
//         ));
//   }

//   // Get.to(() => Chat(
//   //       chatRoomId: '1',
//   //     ));
//   String getchatRoomId(String user1, String user2) {
//     if (user1[0].toLowerCase().codeUnits[0] >
//         user2.toLowerCase().codeUnits[0]) {
//       return "$user1$user2";
//     } else {
//       return "$user2$user1";
//     }
//   }
}
