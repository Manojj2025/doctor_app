import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget search() {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 46,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: Get.width * 0.90,
      decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white)),
      child: TextField(
        onTap: () => Get.to(() => SearchView()),
        keyboardType: TextInputType.text,
        cursorColor: AppColors.maincolor,
        style: BaseStyles.mainMedium13,
        readOnly: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.whiteColor),
                ),
              ),
              child: Icon(
                Icons.search,
                color: AppColors.maincolor,
              ),
            ),
          ),
          hintText: 'Search Here',
          hintStyle: BaseStyles.fullgrey,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
