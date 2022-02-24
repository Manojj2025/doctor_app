import 'package:doctor_app/app/constants/constants.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/myappointment_controller.dart';
import 'package:doctor_app/app/modules/patient/views/bottom_bar_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/doctorappintmnetprofiledetails_view.dart';
import 'package:doctor_app/app/modules/patient/views/message_list.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MyappointmentView extends GetView<MyappointmentController> {
  // QuerySnapshot? searchResultSnapshot;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyappointmentController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (index) {
                controller.index.value = index;
                controller.tabController.index = index;

                print(index);
                print(controller.tabController.index);

                // print(controller.type.value.toString());
                // controller.Bookc();
              },
              indicatorColor: AppColors.maincolor,
              tabs: controller.myTabs),
          title: Text('My Appointment'),
        ),
        body: TabBarView(
          controller: controller.tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Scheduled(),
            Center(
              child: Text(
                'No Cancelled',
                style: BaseStyles.blackBold15,
              ),
            ),
            Cancelled(),
          ],
        ),
      ),
    );
  }

  Scheduled() {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controller.booked.length,
          itemBuilder: (BuildContext context, int index) {
            final data = controller.booked[index];
            print(controller.booked[index]['appointment_id'].toString());
            print(data.toString());
            return controller.delete.value == true
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  color: AppColors.maincolor.withOpacity(0.1),
                                ),
                              ],
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    modalBottomSheetMenu(
                                        context, controller, index);
                                  },
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.more_horiz,
                                        size: 25,
                                        color: AppColors.maincolor,
                                      )),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: AppColors.whiteColor,
                                      backgroundImage: NetworkImage(
                                          '${controller.doctorimg}/${data['doctorImage'].toString()}'),
                                    ),
                                    widthSpace10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Doctor Name: ',
                                              style: BaseStyles.mainMedium15,
                                            ),
                                            Text(
                                              '${controller.booked[index]['doctor_name'].toString()}',
                                              style: BaseStyles.grey15,
                                            ),
                                          ],
                                        ),
                                        heightSpace10,
                                        Row(
                                          children: [
                                            Text(
                                              'Doctor Charges: ',
                                              style: BaseStyles.mainMedium15,
                                            ),
                                            Text(
                                              '\₹${controller.booked[index]['fees'].toString()} Charges',
                                              style: BaseStyles.grey15,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                heightSpace10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Date: ',
                                          style: BaseStyles.mainMedium15,
                                        ),
                                        Text(
                                          '${controller.booked[index]['date'].toString()}',
                                          style: BaseStyles.grey15,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'time: ',
                                          style: BaseStyles.mainMedium15,
                                        ),
                                        Text(
                                          '${controller.booked[index]['time'].toString()}',
                                          style: BaseStyles.grey15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                heightSpace10,
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                        () =>
                                            DoctorappintmnetprofiledetailsView(),
                                        arguments: {
                                          'doctor_detail': data,
                                          'url': controller.doctorimg
                                        });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: Get.width * 0.90,
                                    decoration: BoxDecoration(
                                        color: AppColors.maincolor),
                                    child: Text(
                                      'View Details',
                                      style: BaseStyles.whiteBold15,
                                    ),
                                  ),
                                ),
                                // heightSpace10,
                                // Row(
                                //   children: [
                                //     Text(
                                //       'Doctor Charges: ',
                                //       style: BaseStyles.mainMedium15,
                                //     ),
                                //     Text(
                                //       '\₹${controller.booked[index]['fees'].toString()} consultation charge',
                                //       style: BaseStyles.grey15,
                                //     ),
                                //   ],
                                // ),
                                // heightSpace10,
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Text(
                                //       'Doctor Specilist: ',
                                //       style: BaseStyles.mainMedium15,
                                //     ),
                                //     Expanded(
                                //         child: Text(
                                //       '${controller.booked[index]['specilist'].toString()}',
                                //       style: BaseStyles.grey15,
                                //     )),
                                //   ],
                                // ),

                                // userList()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          }),
    );
  }

  Cancelled() {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controller.cancelled.length,
          itemBuilder: (BuildContext context, int index) {
            var data = controller.cancelled[index];
            print(data.toString());
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          color: AppColors.maincolor.withOpacity(0.1),
                        ),
                      ],
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Doctor Name: ',
                                  style: BaseStyles.mainMedium15,
                                ),
                                Text(
                                  '${controller.cancelled[index]['doctor_name'].toString()}',
                                  style: BaseStyles.grey15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'BookingType: ',
                                  style: BaseStyles.mainMedium15,
                                ),
                                Text(
                                  '${controller.cancelled[index]['bookingType'].toString()}',
                                  style: BaseStyles.grey15,
                                ),
                              ],
                            ),
                          ],
                        ),
                        heightSpace10,
                        Row(
                          children: [
                            Text(
                              'Doctor Charges: ',
                              style: BaseStyles.mainMedium15,
                            ),
                            Text(
                              '\₹${controller.cancelled[index]['fees'].toString()} consultation charge',
                              style: BaseStyles.grey15,
                            ),
                          ],
                        ),
                        heightSpace10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Date: ',
                                  style: BaseStyles.mainMedium15,
                                ),
                                Text(
                                  '${controller.cancelled[index]['date'].toString()}',
                                  style: BaseStyles.grey15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'time: ',
                                  style: BaseStyles.mainMedium15,
                                ),
                                Text(
                                  '${controller.cancelled[index]['time'].toString()}',
                                  style: BaseStyles.grey15,
                                ),
                              ],
                            ),
                          ],
                        ),
                        heightSpace10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor Specilist: ',
                              style: BaseStyles.mainMedium15,
                            ),
                            Expanded(
                                child: Text(
                              '${controller.cancelled[index]['specilist'].toString()}',
                              style: BaseStyles.grey15,
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  modalBottomSheetMenu(context, data, index) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 50.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
              decoration: new BoxDecoration(
                color: AppColors.maincolor,
              ),
              child: GestureDetector(
                  onTap: () {
                    Get.dialog(
                      Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Center(
                              //   child: Text(
                              //     'Delete Patient',
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 20,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              Text(
                                'Why Do you Delete Your Appointment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: controller.reasontxt,
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
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: 'Enter Your Reason',
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AppColors.maincolor),
                                          child: Text('Cancel')),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (controller.reasontxt.text == '') {
                                          showToast(
                                              'Please submit your reason ');
                                        } else {
                                          Get.back();
                                          controller.delete.value = true;
                                          controller.Bookcancelled(
                                              controller.booked[index]
                                                  ['appointment_id'],
                                              controller.reasontxt.text);
                                          Get.offAll(() => BottomBarView());
                                        }
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AppColors.maincolor),
                                          child: Text('Delete',
                                              style: BaseStyles.whiteBold15)),
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
                  child: Center(
                    child: Text(
                      'Delete Appintment',
                      style: BaseStyles.whiteMedium18,
                    ),
                  )),
            ),
          );
        });
  }

  // searchByName() {
  //   return FirebaseFirestore.instance
  //       .collection("data")
  //       .where('user_name', isEqualTo: 'manoj jangid')
  //       .get();
  // }

  // Widget userList() {
  //   // DatabaseMethods().getChats('2');
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: controller.searchResultSnapshot!.docs.length,
  //       itemBuilder: (context, index) {
  //         return userTile(
  //           controller.searchResultSnapshot!.docs[index]["user_name"],
  //         );
  //       });
  // }

  // Widget userTile(String userName) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  //     child: Row(
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               userName,
  //               style: TextStyle(color: Colors.white, fontSize: 16),
  //             ),
  //           ],
  //         ),
  //         Spacer(),
  //         GestureDetector(
  //           onTap: () {
  //             // sendMessage(userName);
  //           },
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //             decoration: BoxDecoration(
  //                 color: Colors.blue, borderRadius: BorderRadius.circular(24)),
  //             child: Text(
  //               "Message",
  //               style: TextStyle(color: Colors.white, fontSize: 16),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // sendMessage() {
  //   // String username = 'manoj jangid';
  //   List<String> users = [Constants.myName, 'aaa'];
  //   print(users);
  //   // print(userName);
  //   String chatRoomId = getchatRoomId(Constants.myName, 'aaa');

  //   Map<String, dynamic> chatRoom = {
  //     "data": users,
  //     "chatRoomId": chatRoomId,
  //   };
  //   print(chatRoomId);
  //   DatabaseMethods().addChatRoom(chatRoom, chatRoomId);

  //   Get.to(() => Chat(
  //         chatRoomId: chatRoomId,
  //       ));
  // }

  // // Get.to(() => Chat(
  // //       chatRoomId: '1',
  // //     ));
  // String getchatRoomId(String user1, String user2) {
  //   if (user1[0].toLowerCase().codeUnits[0] >
  //       user2.toLowerCase().codeUnits[0]) {
  //     return "$user1$user2";
  //   } else {
  //     return "$user2$user1";
  //   }
  // }
}
