import 'package:doctor_app/app/modules/patient/models/consult_model.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConsultController extends GetxController {
  final consult = [].obs;
  var consultpath = '';
  var searchurl = '';
  var box = GetStorage();
  final clearS = false.obs;
  final doctorlist = [].obs;
  TextEditingController searchcontroller = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    consultc();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  consultc() async {
    try {
      var res = await ApiProvider().consultP();
      consultpath = res['doctor_image_url'];
      // item = res['image'][0]['id'];
      List<ConsultImage> finalres = (res['image'] as List)
          .map((item) => ConsultImage.fromJson(item))
          .toList();

      // print(item.toString());
      consult.addAll(finalres);
      print(res.toString());
    } catch (e) {
      // print(sp_detail.toString());
      showToast(e.toString());
    }
  }
}
