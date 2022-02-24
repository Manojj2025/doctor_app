import 'dart:async';

import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchurl = '';
  final doctorlist = [].obs;
  TextEditingController searchc = TextEditingController();
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
  search(keyword) async {
    Timer? _debounce;

    int _debouncetime = 1;
    if (_debounce != null) {
      if (_debounce.isActive) _debounce.cancel();
    }
    _debounce = Timer(Duration(seconds: _debouncetime), () async {
      doctorlist.clear();
      var data = {'keyword': keyword};
      try {
        var res = await ApiProvider().searchP(data);
        doctorlist.addAll(res['image']);
        searchurl = res['doctor_image_url'];
        print(doctorlist);
      } catch (e) {
        showToast(e.toString());
      }
    });
  }
}
