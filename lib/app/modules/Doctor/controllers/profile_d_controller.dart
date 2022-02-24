import 'package:doctor_app/app/constants/constants.dart';
import 'package:doctor_app/app/modules/Doctor/Provider/api_doctor_provider.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/bottombar_d_controller.dart';
import 'package:doctor_app/app/modules/Doctor/views/bottombar_d_view.dart';
import 'package:doctor_app/app/modules/patient/message_dao.dart';
import 'package:doctor_app/app/modules/patient/models/user.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var box = GetStorage();
  final dgender = ''.obs;
  final image_path = ''.obs;
  final loading = true.obs;
  final messageDao = MessageDao();
  TextEditingController dname = TextEditingController();
  TextEditingController dage = TextEditingController();
  TextEditingController demail = TextEditingController();

  var data = Get.find<BottombarController>().profile_data;
  @override
  void onInit() {
    super.onInit();
    get_imageC();
    dname = TextEditingController(text: data['name']);
    dage = TextEditingController(text: data['age'].toString());
    demail = TextEditingController(text: data['email']);
    dgender.value = data['gender'] ?? '';
    if (usertype() == 'doctor') {
      Constants.sendid = getid().toString();
      print(Constants.sendid.toString());
    } else {
      Constants.sendid = getid().toString();
      print(Constants.sendid.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  get_imageC() async {
    try {
      var res = await ApiDoctorProvider().getdoctorimageP();
      loading.value = false;

      image_path.value = '${res['url']}/${res['profileImage']['image']}';
      box.write('imageurl', '${res['url']}/${res['profileImage']['image']}');
      loading.value = false;
    } catch (e) {
      showToast(e.toString());
    }
  }

  account_c() async {
    String name = dname.text;
    String genderc = dgender.value;
    String email = demail.text;
    String age = dage.text;

    if (name == '') {
      showToast('fill your name');
    } else if (genderc == '') {
      showToast('fill your gender');
    } else if (age == '') {
      showToast('fill your age');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      showToast('Please enter a valid email address');
    } else {
      pleaseWait();
      try {
        var data = {
          'name': name,
          'email': email,
          'gender': genderc,
          'age': age,
        };
        var res = await ApiDoctorProvider().profiledoctorP(data);

        final user = User(getid().toString(), name, email);
        messageDao.saveMessage(user);
        if (usertype() == 'doctor') {
          Constants.sendid = getid().toString();
          print(Constants.sendid.toString());
        } else {
          Constants.sendid = getid().toString();
          print(Constants.sendid.toString());
        }
        // if(res['message']=='success'){

        // }
        // Map<String, String> userDataMap = {
        //   "user_named": name,
        //   "user_email": email
        // };

        // DatabaseMethods().addUserInfoD(userDataMap);

        // QuerySnapshot userInfoSnapshot =
        //     await DatabaseMethods().getUserInfoD(name);

        // // HelperFunctions.saveUserLoggedInSharedPreference(true);
        // HelperFunctions.saveUserNameSharedPreference(
        //     userInfoSnapshot.docs[0]["user_named"]);
        print(res);

        showToast('your profile uploaded successfully');
        Get.offAll(() => BottombarView());
      } catch (e) {
        showToast(e.toString());
      }
      Get.back();
    }
  }
}
