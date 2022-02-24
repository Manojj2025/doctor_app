import 'dart:io';

import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/imagedoctor_controller.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagedoctorView extends GetView<ImagedoctorController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ImagedoctorController());
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text('Profile Photo', style: BaseStyles.whitebold18),
                      GestureDetector(
                        onTap: () {
                          controller.imagecontroller(ImageSource.gallery);
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                      child: Container(
                          // height: Get.height / 2,
                          color: Colors.white,
                          child: controller.isfilepicked.value == false
                              ? getProfileImage() == ''
                                  ? Image.asset(
                                      'assets/images/img1.jpg',
                                      width: Get.width,
                                    )
                                  : Image.network(
                                      controller.imageDUpdate.value.toString(),
                                      width: Get.width,
                                    )
                              : Image.file(
                                  File(controller.selectedImagepath.value)))),
                ),
                controller.isfilepicked.value == false
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child:
                                  Text('Cancel', style: BaseStyles.whitebold18),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.ChangePhoto();
                              },
                              child:
                                  Text('Done', style: BaseStyles.whitebold18),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
