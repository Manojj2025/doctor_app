import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaymentView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaymentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PaymentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
