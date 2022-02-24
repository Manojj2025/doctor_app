import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

signout(controller) {
  return Get.defaultDialog(
    titleStyle: BaseStyles.mainMedium20,
    title: DrawerTitle.signout,
    middleText: 'Do you really want to sign out',
    cancel: cancleBtn(),
    confirm: confirmBtn(
        action: () {
          if (usertype() == 'doctor') {
            controller.logout_doctorC();
          } else {
            controller.logoutC();
          }
        },
        label: DrawerTitle.signout),
  );
}

confirmBtn({required action, required label}) {
  return GestureDetector(
    onTap: action,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.maincolor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label, style: BaseStyles.whiteBold13),
    ),
  );
}

cancleBtn() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.dividerGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        'Cancel',
        style: BaseStyles.whiteBold13,
      ),
    ),
  );
}
