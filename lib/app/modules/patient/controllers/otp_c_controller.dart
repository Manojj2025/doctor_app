import 'package:doctor_app/app/constants/global_var.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  var box = GetStorage();
  var old_otp;
  var usertype;

  late Stream chatRooms;
  @override
  void onInit() {
    super.onInit();
    old_otp = box.read('otp') ?? '';
    usertype = box.read('user_type') ?? '';

    print(usertype + 'manoj');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  verifyOtpC() async {
    String otp = otpController.text;
    var mobile = box.read('mobile');
    pleaseWait();
    try {
      var data = {
        'mobile': mobile,
        'otp': otp,
        'fcm_token': GlobalVar.global.deviceToken.toString(),
      };
      var res = await ApiProvider().verifyOtp(data);

      // box.write('token', res['token']);
      // // print(res['token']);
      otpController.text = '';
      box.write('token', res['token']);
      print(res);
      if (usertype == 'patient') {
        print(res);

        Get.offNamed('/bottomc');
      } else if (usertype == 'doctor') {
        // box.write('token', res['token']);
        print(res);
        Get.offNamed('/bottomD');
      }
      // Get.back();
    } catch (e) {
      showToast(e.toString());
      Get.back();
    }
  }
}
