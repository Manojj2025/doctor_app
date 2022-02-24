import 'dart:async';

import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var box = GetStorage();
  var usertype;
  @override
  void onInit() {
    super.onInit();
    usertype = box.read('user_type') ?? '';
    print(getToken());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  gotopage() {
    return Future.delayed(
        Duration(milliseconds: 100),
        () => getToken() == ''
            ? Get.offAndToNamed('/login')
            : usertype == 'doctor'
                ? Get.offAndToNamed('/bottomD')
                : Get.offAndToNamed('/bottomc'));
  }
}
