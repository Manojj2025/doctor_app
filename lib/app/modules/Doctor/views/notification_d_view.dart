import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotificationView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios)),
              Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Notifications'))),
              SizedBox(width: 30),
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/scientist.png',
                              width: 50, height: 50),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("You have a new appointment",
                                    style: TextStyle(fontSize: 20)),
                                Text(
                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                }),
          ],
        ));
  }
}
