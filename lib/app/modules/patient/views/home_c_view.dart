import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/app/constants/app_basestyles.dart';
import 'package:doctor_app/app/constants/app_colors.dart';
import 'package:doctor_app/app/constants/strings.dart';
import 'package:doctor_app/app/modules/patient/controllers/home_c_controller.dart';
import 'package:doctor_app/app/modules/patient/models/banner_model.dart';
import 'package:doctor_app/app/modules/patient/models/diseases_spacialist_model.dart';
import 'package:doctor_app/app/modules/patient/models/self_check_model.dart';
import 'package:doctor_app/app/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/selfcheck_details_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
        drawer: mainDrawer(controller),
        appBar: AppBar(
          title: Text(HomeViewtitles.home),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/notification');
                },
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: Obx(
          () => ListView(
            children: [
              controller.loading.value == true
                  ? Container(
                      color: AppColors.grey,
                      height: Get.width / 2,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColors.maincolor,
                      )),
                    )
                  : slider1(),
              heightSpace20,
              Container(
                margin: EdgeInsets.only(left: Get.width * 0.30, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      HomeViewtitles.choose,
                      style: BaseStyles.mainBold18,
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        var item = controller.selfcheck;
                        var imagepat = controller.imagepathself;
                        Get.toNamed('/selfviewall', arguments: {
                          'item': item,
                          'imagepat': imagepat,
                          'imagepathself': controller.imagepathself
                        });
                      },
                      child: Text(
                        HomeViewtitles.view,
                        style: BaseStyles.mainMedium14,
                      ),
                    )
                  ],
                ),
              ),
              heightSpace10,
              Selfcheck(),
              heightSpace20,
              controller.loading.value == true
                  ? Container(
                      color: AppColors.grey,
                      height: Get.width / 2,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColors.maincolor,
                      )),
                    )
                  : slider2(),
              heightSpace20,
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      HomeViewtitles.diseases,
                      style: BaseStyles.mainBold18,
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        var item = controller.diseases;
                        var imagepat = controller.imagepathdiseases;

                        Get.toNamed('/view', arguments: {
                          'item': item,
                          'imagepat': imagepat,
                          'type': 'diseases'
                        });
                      },
                      child: Text(
                        HomeViewtitles.view,
                        style: BaseStyles.mainMedium14,
                      ),
                    )
                  ],
                ),
              ),
              heightSpace10,
              diseases(),
              heightSpace20,
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      HomeViewtitles.specialities,
                      style: BaseStyles.mainBold18,
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        var item = controller.specialist;
                        var imagepat = controller.imagepathspecialist;

                        Get.toNamed('/view', arguments: {
                          'item': item,
                          'imagepat': imagepat,
                          'type': 'specialist'
                        });
                      },
                      child: Text(
                        HomeViewtitles.view,
                        style: BaseStyles.mainMedium14,
                      ),
                    )
                  ],
                ),
              ),
              specialities(),
              heightSpace20,
            ],
          ),
        ));
  }

  slider1() {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
              height: Get.width / 2,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.sliderCurrentIndex.value = index;
              }),
          items: List.generate(controller.sliders.length, (index) {
            BannerImage items = controller.sliders[index];
            return controller.sliders.length == 0
                ? Container(
                    color: AppColors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Center(
                      child: Text(
                        'No Slider Available',
                        style: BaseStyles.black15,
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${controller.imagepathbanner}/${items.bannerImage1.toString()}',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
          }),
        ),
        Positioned.fill(
          top: (Get.width / 2) - 28,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  // color: sliderContainerGrey,
                  ),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.sliders.length,
                  itemBuilder: (context, index) {
                    return pointer1(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  pointer1(index) {
    return Obx(
      () => Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: controller.sliderCurrentIndex.value == index
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }

  Selfcheck() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, top: 10),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemCount: controller.limit1.length,
          itemBuilder: (BuildContext context, index) {
            SelfImage item = controller.limit1[index];
            var data = [
              "S101",
              "S102",
              "S104",
              "S103",
              "S107",
              "S109",
              "S106",
              "S105",
              "S108",
            ];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/selfcheck', arguments: {
                  'item': item,
                  'imagepathself': controller.imagepathself,
                  'data2': data[index]
                });
                // Get.find<SelfcheckDetailsController>().enableBluetooth();
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(width: 0.3, color: AppColors.grey),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${controller.imagepathself}/${item.image.toString()}',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      item.title.toString(),
                      style: BaseStyles.mainMedium13,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  slider2() {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
              height: Get.width / 2,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.sliderCurrentIndex.value = index;
              }),
          items: List.generate(controller.sliders.length, (index) {
            BannerImage items = controller.sliders[index];
            return controller.sliders.length == 0
                ? Container(
                    color: AppColors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Center(
                      child: Text(
                        'No Slider Available',
                        style: BaseStyles.black15,
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${controller.imagepathbanner}/${items.bannerImage2.toString()}',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
          }),
        ),
        Positioned.fill(
          top: (Get.width / 2) - 28,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  // color: sliderContainerGrey,
                  ),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.sliders.length,
                  itemBuilder: (context, index) {
                    return pointer1(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  pointe2(index) {
    return Obx(
      () => Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: controller.sliderCurrentIndex.value == index
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }

  diseases() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 0.0),
        itemCount: controller.limit2.length,
        itemBuilder: (BuildContext context, index) {
          DSImage item = controller.limit2[index];

          return GestureDetector(
            onTap: () {
              Get.toNamed('/homedetail',
                  arguments: {'item': item, 'type': 'diseases'});
            },
            child: Column(
              children: [
                heightSpace10,
                Container(
                  height: 60,
                  width: 60,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${controller.imagepathdiseases}/${item.image.toString()}',
                      ),
                    ),
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                    // border: Border.all(width: 0.3, color: AppColors.grey),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        color: AppColors.maincolor.withOpacity(0.1),
                      ),
                    ],
                  ),
                ),
                heightSpace10,
                Expanded(
                  child: Text(
                    item.title.toString(),
                    style: BaseStyles.mainMedium13,
                    textAlign: TextAlign.center,
                  ),
                ),
                // heightSpace10,
              ],
            ),
          );
        });
  }

  specialities() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, top: 10),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemCount: controller.limit3.length,
          itemBuilder: (BuildContext context, index) {
            DSImage item = controller.limit3[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/homedetail',
                    arguments: {'item': item, 'type': 'specialist'});
              },
              child: Column(
                children: [
                  heightSpace10,
                  Container(
                    height: 80,
                    width: Get.width / 4,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${controller.imagepathspecialist}/${item.image.toString()}',
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
                  heightSpace10,
                  Expanded(
                    child: Text(
                      item.title.toString(),
                      style: BaseStyles.mainMedium13,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // heightSpace10,
                ],
              ),
            );
          }),
    );
  }
}
