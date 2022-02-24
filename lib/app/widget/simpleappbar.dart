import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/route_manager.dart';

simpleappbar(viewname, bool backicon) {
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
          Text(viewname),
        ],
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/walletHistory');
            },
            child: SvgPicture.asset(
              'assets/icons/wallet.svg',
              height: 25,
              width: 25,
              color: Colors.white,
              theme: SvgTheme(currentColor: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/notification');
            },
            child: Icon(
              Icons.notifications,
              size: 30,
            ),
          )
        ],
      )
    ],
  );
}
