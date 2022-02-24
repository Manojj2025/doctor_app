import 'package:doctor_app/app/constants/app_colors.dart';
import 'package:doctor_app/app/constants/strings.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/bottombar_d_controller.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BottombarView extends GetView<BottombarController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BottombarController());
    return WillPopScope(
      onWillPop: () async {
        final differnce = DateTime.now().difference(controller.timer);
        final isExit = differnce >= Duration(seconds: 2);
        controller.timer = DateTime.now();
        if (isExit) {
          final message = 'Press back again to exit';
          showToast(message);
          return false;
        } else {
          return true;
        }
      },
      child: Obx(
        () => Scaffold(
          bottomNavigationBar: Theme(
            data: ThemeData(
              brightness: Brightness.light,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              selectedIconTheme: IconThemeData(
                // opacity: 0.1,
                color: AppColors.whiteColor,
              ),
              unselectedIconTheme: IconThemeData(
                // opacity: 0.1,
                color: AppColors.grey.withOpacity(0.8),
              ),
              unselectedItemColor: AppColors.grey.withOpacity(0.8),
              unselectedLabelStyle: TextStyle(
                  color: AppColors.grey.withOpacity(0.8),
                  fontWeight: FontWeight.bold),
              backgroundColor: Theme.of(context).primaryColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.whiteColor,
              selectedLabelStyle: BaseStyles.whiteBold13,
              onTap: controller.onTabTapped,
              currentIndex: controller
                  .currentIndex.value, // this will be set when a tab is tapped
              items: [
                BottomNavigationBarItem(
                    label: BottomStrings.explore,
                    icon: ImageIcon(
                      AssetImage(
                        BottomBarImages.explore,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: BottomStrings.account,
                    icon: ImageIcon(
                      AssetImage(
                        BottomBarImages.account,
                      ),
                    )),
              ],
            ),
          ),
          body: controller.children[controller.currentIndex.value],
        ),
      ),
    );
  }
}
