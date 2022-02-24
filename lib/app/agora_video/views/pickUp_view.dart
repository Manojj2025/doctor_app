import 'package:doctor_app/app/agora_video/controllers/call_page_controller.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickUpView extends GetView<CallPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Doctor is Calling',
                style: BaseStyles.mainBold18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      color: AppColors.redColor,
                      child: Text(
                        'Decline',
                        style: BaseStyles.whiteBold15,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.back();
                      controller.onJoin();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      color: AppColors.greencolor,
                      child: Text(
                        'Accept',
                        style: BaseStyles.whiteBold15,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
