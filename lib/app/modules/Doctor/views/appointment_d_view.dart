import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/appointment_d_controller.dart';
import 'package:doctor_app/app/modules/Doctor/views/appointment_detail_view.dart';
import 'package:doctor_app/app/widget/main_drawer.dart';
import 'package:doctor_app/app/widget/simpleappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class AppointmentView extends GetView<appointmentController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => appointmentController());
    return Scaffold(
        drawer: mainDrawer(controller),
        appBar: AppBar(
          title: simpleappbar('My Appointment', false),
          centerTitle: false,
        ),
        body: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.today.value = true;
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: controller.today.value
                              ? Get.theme.primaryColor
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Text(
                        'Today',
                        style: TextStyle(
                            color: controller.today.value
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.today.value = false;
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: !controller.today.value
                              ? Get.theme.primaryColor
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Text(
                        'Completed',
                        style: TextStyle(
                            color: !controller.today.value
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              controller.today.value
                  ? Expanded(
                      child: controller.loading.value == true
                          ? Center(child: CircularProgressIndicator())
                          : controller.doctorbooked.length == 0
                              ? Center(
                                  child: Text(
                                    'No Aappointment list',
                                    style: BaseStyles.blackBold15,
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.doctorbooked.length,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return listdesign(index);
                                  }),
                    )
                  : Expanded(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                child: Text(
                                  'No completed Aappointment list',
                                  style: BaseStyles.blackBold18,
                                ),
                              ),
                            );
                          }),
                    )
            ],
          ),
        ));
  }

  listdesign(index) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed('/patientreport');
        Get.to(() => AppointmentDetailView(), arguments: {
          'appointment_id': controller.doctorbooked[index]['appointment_id']
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Divider(
              color: Get.theme.primaryColor,
              thickness: 1,
            ),
            Row(children: [
              SizedBox(
                width: 10,
              ),
              controller.loading.value == true
                  ? CircularProgressIndicator()
                  : CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        '${controller.url}/${controller.doctorbooked[index]['image'].toString()}',
                      ),
                    ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.doctorbooked[index]['patient_name'].toString()}',
                            style: TextStyle(
                                fontSize: 14, color: Get.theme.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${controller.doctorbooked[index]['date'].toString()}',
                        style: TextStyle(
                            fontSize: 14, color: Get.theme.primaryColor),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${controller.doctorbooked[index]['mobile'].toString()}',
                        style: TextStyle(
                            fontSize: 14, color: Get.theme.primaryColor),
                      ),
                    ]),
              ),
              Text(
                '${controller.doctorbooked[index]['time'].toString().substring(0, 7)}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greencolor),
              ),
              SizedBox(width: 10),
              SvgPicture.asset('assets/icons/double_forward_arrow.svg'),
              SizedBox(width: 10)
            ]),
          ],
        ),
      ),
    );
  }
}
