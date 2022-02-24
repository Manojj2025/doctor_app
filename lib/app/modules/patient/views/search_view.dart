import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 30,
          titleSpacing: 10,
          title: Container(
            width: MediaQuery.of(context).size.width,
            // color: Colors.grey,
            child: TextField(
              onChanged: (value) {
                controller.search(value);
              },
              controller: controller.searchc,
              focusNode: FocusNode(),
              autofocus: true,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.searchc.clear();
                    controller.doctorlist.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: 'Search Here',
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                controller.doctorlist.length == 0
                    ? Center(
                        child: Text(
                          'No Doctor Found',
                          style: BaseStyles.blackBold15,
                        ),
                      )
                    : DoctorListsearch()
              ],
            ),
          ),
        ));
  }

  DoctorListsearch() {
    return ListView.builder(
      itemCount: controller.doctorlist.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var item = controller.doctorlist[index];

        print(item.toString());
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed('/slots', arguments: {'id': item.id});
                // Get.to(() => ExploreCatagoryView());
                // item['search_type'] == "product"
                //     ? ScreenNav().pushNavigate(
                //         context,
                //         ProductDetailsScrn(
                //           productId: item['id'],
                //         ))
                //     : ScreenNav().pushNavigate(
                //         context,
                //         SearchProductListScrn(
                //           productId: item['id'],
                //         ));
              },
              child: Container(
                // height: Get.height * 0.30,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        color: AppColors.maincolor.withOpacity(0.1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 153,
                            width: 120,
                            decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    color: AppColors.maincolor.withOpacity(0.1),
                                  ),
                                ],
                                color: AppColors.maincolor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Container(
                                  // height: 133,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5.0),
                                        topLeft: Radius.circular(5.0)),
                                  ),
                                  // width: 120,
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          '${controller.searchurl}/${item['doctor_image'].toString()}',
                                      fit: BoxFit.contain),
                                  // width: 120,
                                ),
                                heightSpace10,
                                Expanded(
                                  child: Text(
                                    item['experience']!,
                                    style: BaseStyles.whiteBold13,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          widthSpace20,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['doctor_name']!,
                                  style: BaseStyles.blackMedium13,
                                ),
                                heightSpace10,
                                Text(
                                  item['description']!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: BaseStyles.blackMedium13,
                                ),
                                heightSpace10,
                                Text(
                                  item['languages']!,
                                  style: BaseStyles.blackMedium13,
                                ),
                                heightSpace20,
                                Row(
                                  children: [
                                    Text(
                                      '₹ ${item['real_rate'].toString()} ',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      ' | ₹ ${item['offer_rate'].toString()}',
                                      style: BaseStyles.blackMedium13,
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: item['rating']!.toDouble(),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: AppColors.maincolor,
                                        ),
                                        itemCount: 5,
                                        itemSize: 25.0,
                                        unratedColor: AppColors.yellow,
                                        direction: Axis.horizontal,
                                      ),
                                      widthSpace10,
                                      Expanded(
                                        child: Text(
                                          '${item['rating']!.toDouble().toString()}',
                                          style: BaseStyles.blackBold15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                heightSpace10
                              ],
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/slots', arguments: {'id': item.id});
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  color: AppColors.maincolor.withOpacity(0.1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.maincolor,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              ConsultViewtitles.appointmentb,
                              style: BaseStyles.whiteBold13,
                            ),
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [

                      //     // Container(
                      //     //   decoration: BoxDecoration(
                      //     //     boxShadow: <BoxShadow>[
                      //     //       BoxShadow(
                      //     //         blurRadius: 5.0,
                      //     //         spreadRadius: 1.0,
                      //     //         color: AppColors.maincolor.withOpacity(0.1),
                      //     //       ),
                      //     //     ],
                      //     //     borderRadius: BorderRadius.circular(5),
                      //     //     color: AppColors.maincolor,
                      //     //   ),
                      //     //   padding: EdgeInsets.symmetric(
                      //     //       horizontal: 30, vertical: 10),
                      //     //   child: Text(
                      //     //     ConsultViewtitles.Consultb,
                      //     //     style: BaseStyles.whiteBold13,
                      //     //   ),
                      //     // )
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Divider()
          ],
        );
      },
    );
  }
}
