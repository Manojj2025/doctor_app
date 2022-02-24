import 'package:doctor_app/app/constants/app_basestyles.dart';
import 'package:doctor_app/app/constants/app_colors.dart';
import 'package:doctor_app/app/constants/strings.dart';
import 'package:doctor_app/app/modules/patient/controllers/otp_c_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OtpController());
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.maincolor,
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
                  children: [
                    Container(
                      height: Get.height * 0.60,
                      child: SvgPicture.asset(
                        LoginImages.logo,
                        // color: AppColors.whiteColor,
                        theme: SvgTheme(currentColor: AppColors.whiteColor),
                      ),
                    ),
                    Text(
                      'verification otp here --${controller.old_otp.toString()}',
                      style: BaseStyles.whiteBold13,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.30,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(26)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 62,
                              width: Get.width * 0.90,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: PinCodeTextField(
                                  appContext: context,
                                  enablePinAutofill: false,
                                  autoDismissKeyboard: true,

                                  pastedTextStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  length: 4,
                                  obscureText: false,
                                  obscuringCharacter: '*',
                                  animationType: AnimationType.fade,
                                  validator: (v) {
                                    return null;
                                    // if (v.length < 5) {
                                    //   return 'Invalid Pin';
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.underline,
                                    borderRadius: BorderRadius.circular(50),
                                    fieldHeight: 60,
                                    fieldWidth: 50,
                                    activeColor: AppColors.maincolor,
                                    inactiveColor: AppColors.maincolor,
                                    inactiveFillColor: AppColors.whiteColor,
                                    activeFillColor: AppColors.whiteColor,
                                    selectedFillColor: AppColors.whiteColor,
                                  ),
                                  cursorColor: AppColors.maincolor,
                                  animationDuration:
                                      Duration(milliseconds: 300),
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      height: 1.6,
                                      color: AppColors.maincolor),
                                  enableActiveFill: true,
                                  controller: controller.otpController,
                                  keyboardType: TextInputType.number,
                                  boxShadows: [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      color: Colors.grey.withAlpha(10),
                                      // blurRadius: 10,
                                    )
                                  ],
                                  onCompleted: (v) {
                                    print('Completed');
                                  },
                                  // onTap: () {
                                  //   print('Pressed');
                                  // },
                                  onChanged: (value) {
                                    print(value);
                                    // controller.currentText.value = value;
                                  },
                                  beforeTextPaste: (text) {
                                    print('Allowing to paste $text');
                                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                    return true;
                                  },
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.verifyOtpC(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 62,
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                    color: AppColors.maincolor,
                                    borderRadius: BorderRadius.circular(41)),
                                child: Text(
                                  LoginStrings.verify,
                                  style: BaseStyles.whiteBold18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
