import 'package:flutter/material.dart';
import 'package:get/get.dart';

pleaseWait() {
  Get.defaultDialog(
    title: 'Plese Wait...',
    custom: CircularProgressIndicator(),
    content: CircularProgressIndicator(),
    barrierDismissible: false,
    onWillPop: () async {
      return true;
    },
  );
}
