import 'package:doctor_app/app/constants/values.dart';

import 'package:doctor_app/app/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelfCheckViewall extends GetView {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments['item'];
    var url = Get.arguments['imagepat'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appbar('Self Check', true),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // childAspectRatio: 1,
                // mainAxisExtent: 150,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 0.0),
            itemCount: data.length,
            itemBuilder: (BuildContext context, index) {
              var item = data[index];

              return GestureDetector(
                onTap: () {
                  var videourl = Get.arguments['imagepathself'];
                  Get.toNamed('/selfcheck',
                      arguments: {'item': item, 'imagepathself': videourl});
                },
                child: Column(
                  children: [
                    heightSpace10,
                    Flexible(
                      flex: 3,
                      child: Container(
                        // height: 150,
                        width: Get.width / 2.5,
                        // padding: EdgeInsets.symmetric(vertical: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              '${url}/${item.image.toString()}',
                            ),
                          ),
                          color: AppColors.whiteColor,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              color: AppColors.maincolor.withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    heightSpace10,
                    Expanded(
                      child: Text(
                        item.title.toString(),
                        style: BaseStyles.mainMedium16,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // heightSpace10,
                  ],
                ),
              );
            }),
      ),
    );
  }
}
