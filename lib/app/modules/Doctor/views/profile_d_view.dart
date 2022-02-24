import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/profile_d_controller.dart';
import 'package:doctor_app/app/modules/Doctor/views/imagedoctor_view.dart';
import 'package:doctor_app/app/widget/appbar.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return Scaffold(
        appBar: AppBar(
          title: appbar('My Profile', false),
          centerTitle: false,
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ImagedoctorView());
                          },
                          child: Container(
                            width: Get.width * 0.3,
                            height: 100,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.whiteColor,
                                  child: controller.loading.value == true
                                      ? CircularProgressIndicator(
                                          color: AppColors.maincolor,
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: getProfileImage() == null
                                                ? DecorationImage(
                                                    image: AssetImage(
                                                        'assets/icons/person.png'),
                                                    fit: BoxFit.cover)
                                                : DecorationImage(
                                                    image: NetworkImage(
                                                        controller
                                                            .image_path.value
                                                            .toString()),
                                                    fit: BoxFit.cover),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(45),
                                          ),
                                          // child: CircleAvatar(
                                          //   radius: 50,
                                          //   backgroundColor: AppColors.whiteColor,
                                          // child: Image.asset(
                                          //   ImagePath.food,
                                          //   height: 160,
                                          // width: 100,
                                          // ),
                                          // ),
                                        ),
                                ),
                                Positioned(
                                    bottom: 25,
                                    left: 70,
                                    child:
                                        Image.asset('assets/icons/edit.png')),
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    CustomerProfile.name,
                                    style: BaseStyles.blackBold15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ]),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(CustomerProfile.name2,
                            style: BaseStyles.blackBold15),
                        SizedBox(height: 5),
                        Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: decoration(color: Colors.white),
                            child: TextField(
                              controller: controller.dname,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your name',
                              ),
                            )),
                        SizedBox(height: 20),
                        Text(CustomerProfile.gender,
                            style: BaseStyles.blackBold15),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.dgender.value = "Female";
                                },
                                child: Container(
                                  width: Get.width * 0.28,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: decoration(
                                    color: controller.dgender.value == "Female"
                                        ? Get.theme.primaryColor
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    CustomerProfile.Female,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          controller.dgender.value == "Female"
                                              ? AppColors.whiteColor
                                              : AppColors.blacklight,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.dgender.value = "Male";
                                },
                                child: Container(
                                  width: Get.width * 0.28,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: decoration(
                                      color: controller.dgender.value == "Male"
                                          ? Get.theme.primaryColor
                                          : AppColors.whiteColor),
                                  child: Text(
                                    CustomerProfile.male,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: controller.dgender.value == "Male"
                                          ? AppColors.whiteColor
                                          : AppColors.blacklight,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.dgender.value = "Other";
                                },
                                child: Container(
                                  width: Get.width * 0.28,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: decoration(
                                      color: controller.dgender.value == "Other"
                                          ? Get.theme.primaryColor
                                          : AppColors.whiteColor),
                                  child: Text(
                                    CustomerProfile.other,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: controller.dgender.value == "Other"
                                          ? AppColors.whiteColor
                                          : AppColors.blacklight,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(CustomerProfile.age,
                                  style: BaseStyles.blackBold15),
                              SizedBox(height: 5),
                              Container(
                                  width: Get.width * 0.45,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: decoration(color: Colors.white),
                                  child: TextField(
                                    controller: controller.dage,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your Age',
                                    ),
                                  )),
                            ]),
                        SizedBox(height: 20),
                        Text(CustomerProfile.email,
                            style: BaseStyles.blackBold15),
                        SizedBox(height: 5),
                        Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: decoration(color: Colors.white),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: controller.demail,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'doctor@gmail.com',
                                    ),
                                  ),
                                ),
                                Text(CustomerProfile.verify,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Get.theme.primaryColor)),
                                SizedBox(width: 5),
                              ],
                            )),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      controller.account_c();
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: Get.width * 0.5,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: decoration(color: Get.theme.primaryColor),
                        child: Text(CustomerProfile.save,
                            style: BaseStyles.whiteBold18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
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
