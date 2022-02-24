import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/homedetails_controller.dart';
import 'package:doctor_app/app/modules/patient/models/diseases_spacialist_model.dart';
import 'package:doctor_app/app/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewallView extends GetView<HomedetailsController> {
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ViewallController());
    var data = Get.arguments['item'];
    var url = Get.arguments['imagepat'];
    var type = Get.arguments['type'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appbar(type, true),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10.0, top: 10),
        child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 0.0),
            itemCount: data.length,
            itemBuilder: (BuildContext context, index) {
              DSImage item = data[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/homedetail',
                      arguments: {'item': item, 'type': type});
                },
                child: Column(
                  children: [
                    heightSpace10,
                    Flexible(
                      flex: 3,
                      child: Container(
                        // height: 150,
                        width: Get.width / 2.3,
                        // padding: EdgeInsets.symmetric(vertical: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
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
