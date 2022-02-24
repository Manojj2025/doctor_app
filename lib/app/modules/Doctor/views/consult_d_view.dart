import 'package:doctor_app/app/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ConsultView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbar('Consult', true),
        centerTitle: false,
      ),
      body: Center(
        child: Text(
          'ConsultView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
