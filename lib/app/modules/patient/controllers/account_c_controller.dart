import 'package:doctor_app/app/constants/constants.dart';
import 'package:doctor_app/app/modules/patient/controllers/bottom_bar_c_controller.dart';
import 'package:doctor_app/app/modules/patient/models/user.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/modules/patient/views/bottom_bar_c_view.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../message_dao.dart';

class AccountController extends GetxController {
  final nullvalue = ''.obs;
  var box = GetStorage();
  late TextEditingController nametxt;
  late TextEditingController emailtxt;
  late TextEditingController heightext;
  late TextEditingController weighttxt;
  late TextEditingController agetxt;
  final messageDao = MessageDao();
  // final image = {}.obs;
  final loading = true.obs;
  final image_path = ''.obs;
  final gender = ''.obs;
  final setBlood = ''.obs;
  var bloodGroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'].obs;

  var data = Get.find<BottomBarController>().profile_data;
  @override
  void onInit() {
    super.onInit();
    if (usertype() == 'doctor') {
      Constants.sendid = getid().toString();
      print(Constants.sendid.toString());
    } else {
      Constants.sendid = getid().toString();
      print(Constants.sendid.toString());
    }
    nametxt = TextEditingController(text: data['name']);
    emailtxt = TextEditingController(text: data['email']);
    heightext = TextEditingController(text: data['height']);
    weighttxt = TextEditingController(text: data['weight']);
    agetxt = TextEditingController(text: data['age'].toString());
    gender.value = data['gender'] ?? '';
    setBlood.value = data['blood_group'].toString();
    // print(gender.toString());
    account_imageC();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  account_c() async {
    String name = nametxt.text;
    String genderc = gender.value;
    String bloodGroup = setBlood.value;
    String email = emailtxt.text;
    String height = heightext.text;
    String weight = weighttxt.text;
    String age = agetxt.text;

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
    } else if (height == '') {
      showToast('fill your height');
    } else if (weight == '') {
      showToast('fill your weight');
    } else if (bloodGroup == '') {
      showToast('select bloodGroup');
    } else {
      pleaseWait();
      try {
        var data = {
          'name': name,
          'email': email,
          'gender': genderc,
          'age': age,
          'height': height,
          'weight': weight,
          'blood_group': bloodGroup,
        };
        var res = await ApiProvider().account_p(data);
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
        //   "user_namep": name,
        //   "user_email": email
        // };

        // DatabaseMethods().addUserInfoP(userDataMap);
        // QuerySnapshot userInfoSnapshot =
        //     await DatabaseMethods().getUserInfoP(name);

        // // HelperFunctions.saveUserLoggedInSharedPreference(true);
        // HelperFunctions.saveUserNameSharedPreference(
        //     userInfoSnapshot.docs[0]["user_namep"]);
        print(res.toString() + 'hello');
        // box.write('name', nametxt);
        showToast('your profile uploaded successfully');
        Get.offAll(() => BottomBarView());
      } catch (e) {
        showToast(e.toString());
      }
      Get.back();
    }
  }

  account_imageC() async {
    try {
      var res = await ApiProvider().accountimageP();
      // image.addAll(res['data']);
      // image_path = res['url1'];
      image_path.value = '${res['url1']}/${res['data']['profileImage']}';
      loading.value = false;
      print(res.toString() + 'manoj');
      box.write('imageurl', '${res['url1']}/${res['data']['profileImage']}');
      print('${res['url1']}/${res['data']['profileImage']}');
      // print(image_path);
      // print(image);
    } catch (e) {
      showToast(e.toString());
    }
  }
}
