import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/login_c_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return Scaffold(
        backgroundColor: AppColors.maincolor,
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  LoginImages.left,
                  color: AppColors.whiteColor,
                  theme: SvgTheme(currentColor: AppColors.whiteColor),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  LoginImages.right,
                  color: AppColors.whiteColor,
                  theme: SvgTheme(currentColor: AppColors.whiteColor),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Get.height * 0.60,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: LoginStrings.welcome_to,
                                style: BaseStyles.whiteMedium22,
                                children: [
                                  TextSpan(
                                    text: '  LOGIN',
                                    style: BaseStyles.yellow22,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SvgPicture.asset(
                            LoginImages.logo,
                            // color: AppColors.whiteColor,
                            theme: SvgTheme(currentColor: AppColors.whiteColor),
                          ),
                          Text(
                            LoginStrings.x_rays,
                            style: BaseStyles.whiteMedium22,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            LoginStrings.bast_labs,
                            style: BaseStyles.yellow13,
                          ),
                        ],
                      ),
                    ),
                    // heightSpace20,
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: Get.height * 0.30,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(26)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 62,
                              width: Get.width * 0.90,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.2,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(41)),
                              child: TextField(
                                controller:
                                    controller.mobileTextEditingController,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                keyboardType: TextInputType.number,
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(color: AppColors.maincolor),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(15),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(' +91',
                                          style: BaseStyles.mainMedium14)),
                                  prefixStyle: BaseStyles.mainMedium14,
                                  hintText: 'Enter your mobile number',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.mobileLoginC(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 62,
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                    color: AppColors.maincolor,
                                    borderRadius: BorderRadius.circular(41)),
                                child: Text(
                                  LoginStrings.login,
                                  style: BaseStyles.whiteBold18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 50,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
