import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/views/myappointment_view.dart';
import 'package:doctor_app/app/modules/patient/views/textreport_view.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:doctor_app/app/widget/signout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

mainDrawer(controller) {
  return Obx(
    () => SizedBox(
      width: 280,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.maincolor,
                    borderRadius: BorderRadius.circular(10)),
                child: DrawerHeader(
                    curve: Curves.bounceInOut,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getProfileImage() == null
                            ? CircleAvatar(
                                radius: 40,
                                backgroundColor: AppColors.whiteColor,
                                backgroundImage:
                                    AssetImage('assets/icons/person.png'),
                              )
                            : controller.loading.value == true
                                ? CircularProgressIndicator()
                                : CircleAvatar(
                                    radius: 40,
                                    backgroundColor: AppColors.whiteColor,
                                    backgroundImage:
                                        NetworkImage(getProfileImage()),
                                  ),
                        getname() == null
                            ? Text(
                                'Your Name',
                                style: BaseStyles.whiteBold18,
                              )
                            : Text(
                                getname(),
                                style: BaseStyles.whiteBold18,
                              )
                      ],
                    )),
              ),
              heightSpace10,
              usertype() == 'doctor'
                  ? Container()
                  : _draweritem(
                      controller: controller,
                      index: 0,
                      icon: DrawerIcons.appointment,
                      title: DrawerTitle.appointment,
                      action: () {
                        Get.back();
                        Get.to(() => MyappointmentView());
                      }),
              heightSpace10,
              usertype() == 'doctor'
                  ? Container()
                  : _draweritem(
                      controller: controller,
                      index: 2,
                      icon: DrawerIcons.term,
                      title: DrawerTitle.testreport,
                      action: () {
                        Get.back();
                        Get.to(() => TestreportView());
                      }),
              heightSpace10,
              _draweritem(
                  controller: controller,
                  index: 2,
                  icon: DrawerIcons.about,
                  title: DrawerTitle.about,
                  action: () {
                    // Get.to(() => TextreportView());
                    Get.toNamed('/home');
                  }),
              heightSpace10,
              _draweritem(
                  controller: controller,
                  index: 3,
                  icon: DrawerIcons.contact,
                  title: DrawerTitle.contact,
                  action: () {
                    Get.toNamed('/home');
                  }),
              heightSpace10,
              _draweritem(
                  controller: controller,
                  index: 4,
                  icon: DrawerIcons.privacy,
                  title: DrawerTitle.privacy,
                  action: () {
                    Get.toNamed('/home');
                  }),
              heightSpace10,
              _draweritem(
                  controller: controller,
                  index: 5,
                  icon: DrawerIcons.term,
                  title: DrawerTitle.term,
                  action: () {
                    Get.toNamed('/home');
                  }),
              heightSpace10,
              _signout(controller: controller, index: 8),
              heightSpace10,
            ],
          ),
        ),
      ),
    ),
  );
}

_draweritem(
    {required controller,
    required index,
    required icon,
    required title,
    required Function() action}) {
  return GestureDetector(
    onTap: () {
      controller.selectedtab.value = index;

      // Future.delayed(Duration(milliseconds: 500), () {
      //   controller.selectedtab.value = 0;
      // });
      // action;
    },
    child: GestureDetector(
      onTap: action,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: controller.selectedtab.value == index
                ? AppColors.maincolor
                : AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: controller.selectedtab.value == index
                    ? Colors.grey.withOpacity(0.5)
                    : Colors.transparent,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              SvgPicture.asset(
                icon,
                color: controller.selectedtab.value == index
                    ? AppColors.whiteColor
                    : AppColors.maincolor,
                height: 25,
                width: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    color: controller.selectedtab.value == index
                        ? AppColors.whiteColor
                        : AppColors.maincolor,
                    fontSize: 15,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

_signout({required controller, required index}) {
  return InkWell(
    onTap: () {
      controller.selectedtab.value = index;
      Get.back();
      Future.delayed(Duration(milliseconds: 500), () {
        controller.selectedtab.value = 0;
      });
      signout(controller);
    },
    child: Container(
      height: 45,
      decoration: BoxDecoration(
          color: controller.selectedtab.value == index
              ? AppColors.maincolor
              : AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: controller.selectedtab.value == index
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              SvgPicture.asset(
                DrawerIcons.signout,
                color: controller.selectedtab.value == index
                    ? AppColors.whiteColor
                    : AppColors.maincolor,
                height: 25,
                width: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Sign Out',
                style: TextStyle(
                    color: controller.selectedtab.value == index
                        ? AppColors.whiteColor
                        : AppColors.maincolor,
                    fontSize: 15,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// confirmBtn({required action, required label}) {
//   return GestureDetector(
//     onTap: action,
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColors.maincolor,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Text(label, style: BaseStyles.whiteBold13),
//     ),
//   );
// }

// cancleBtn() {
//   return GestureDetector(
//     onTap: () {
//       Get.back();
//     },
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColors.dividerGreyColor,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Text(
//         'Cancle',
//         style: BaseStyles.whiteBold13,
//       ),
//     ),
//   );
// }
