import 'dart:async';

import 'package:doctor_app/app/modules/patient/models/diseases_spcialist_details_model.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomedetailsController extends GetxController {
  var box = GetStorage();
  TextEditingController dssearchc = TextEditingController();
  var disdoctorpath = '';
  final sp_detail = [].obs;
  final loading = true.obs;
  var item = Get.arguments['item'];
  var dssearch = [].obs;
  var type = Get.arguments['type'];
  var dssearchurl = '';
  @override
  void onInit() {
    super.onInit();

    DiseasesSpacialistdoctordetailC();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  DiseasesSpacialistdoctordetailC() async {
    try {
      var data = {'deases_id': item.id, 'type': type};
      print(type);
      var res = await ApiProvider().DiseaseSpacialistdoctordetailP(data);
      disdoctorpath = res['doctor_image_url'];
      List<DSDImage> finalres = (res['image'] as List)
          .map((item) => DSDImage.fromJson(item))
          .toList();
      sp_detail.addAll(finalres);
      loading.value = false;
    } catch (e) {
      showToast(e.toString());
    }
  }

  search(keyword) async {
    Timer? _debounce;

    int _debouncetime = 1;
    if (_debounce != null) {
      if (_debounce.isActive) _debounce.cancel();
    }
    _debounce = Timer(Duration(seconds: _debouncetime), () async {
      dssearch.clear();
      var data = {'keyword': keyword};
      try {
        var res = await ApiProvider().searchP(data);
        dssearch.addAll(res['image']);
        dssearchurl = res['doctor_image_url'];
        print(dssearch);
      } catch (e) {
        showToast(e.toString());
      }
    });
  }
}
