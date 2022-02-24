import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/homedetails_controller.dart';

import 'package:doctor_app/app/widget/appbar.dart';
import 'package:doctor_app/app/widget/doctorlist.dart';
import 'package:doctor_app/app/widget/searchwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomedetailsView extends GetView<HomedetailsController> {
  @override
  Widget build(BuildContext context) {
    // controller.item;
    Get.lazyPut(() => HomedetailsController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: appbar(controller.type, true),
          centerTitle: false,
        ),
        body: Obx(
          () => Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                search(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Text(
                    ConsultViewtitles.showing,
                    style: BaseStyles.mainMedium15,
                    textAlign: TextAlign.start,
                  ),
                ),
                heightSpace10,
                controller.loading.value == true
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.maincolor,
                      ))
                    : DoctorList(
                        imageUrl: controller.disdoctorpath,
                        controller: controller)
              ],
            ),
          ),
        ));
  }
}
