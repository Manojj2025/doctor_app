import 'package:doctor_app/app/constants/app_basestyles.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

appbar(viewname, bool backicon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          backicon
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                )
              : Container(),
          Text(
            viewname,
            style: BaseStyles.whiteBold15,
          ),
        ],
      ),
      SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed('/notification');
        },
        child: backicon == false
            ? Icon(
                Icons.notifications,
                size: 30,
              )
            : Container(),
      )
    ],
  );
}
