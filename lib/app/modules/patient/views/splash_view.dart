import 'package:doctor_app/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SplashController());
    controller.gotopage();
    return Scaffold(
      backgroundColor: AppColors.maincolor,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Divider(
                  color: Colors.transparent,
                  thickness: 2,
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Powered By',
                    style: TextStyle(
                      color: Color(0XFF00C2FF),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Glow Movies',
                    style: TextStyle(
                      color: Color(0XFF00C2FF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
