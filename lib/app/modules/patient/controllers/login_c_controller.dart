import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController mobileTextEditingController = TextEditingController();
  var box = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  mobileLoginC() async {
    String mobileNumber = mobileTextEditingController.text;

    var mobileRegex = new RegExp('^\[0-9]{10}\$');
    if (!mobileRegex.hasMatch(mobileNumber)) {
      showToast('Invalid Mobile Number');
    } else {
      pleaseWait();
      try {
        var data = {'mobile': mobileNumber};
        var res = await ApiProvider().mobileLoginP(data);
        print(res);
        box.write('dPid', res['doctor_id']);
        box.write('user_type', res['user_type']);
        box.write('otp', res['otp']);
        box.write('mobile', res['mobile']);
        mobileTextEditingController.text = '';

        Get.offNamed('/otp');
      } catch (e) {
        showToast(e.toString());
      }
      // Get.back();
    }
  }
}
