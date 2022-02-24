import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DoctorJoinView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DoctorJoinView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DoctorJoinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
