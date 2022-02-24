import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/models/diseases_spcialist_details_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

DoctorList({controller, imageUrl}) {
  return controller.sp_detail.length == 0
      ? Center(
          child: Container(
            child: Text(
              'No Doctor Available',
              style: BaseStyles.blackBold15,
            ),
          ),
        )
      : Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: controller.sp_detail.length,
              itemBuilder: (BuildContext context, int index) {
                DSDImage data = controller.sp_detail[index];
                print(data.toString());
                return Card(
                  child: Container(
                    // height: Get.height * 0.40,
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            color: AppColors.maincolor.withOpacity(0.1),
                          ),
                        ],
                        color: AppColors.whiteColor,
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
                                    color: AppColors.maincolor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 133,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.0),
                                            topLeft: Radius.circular(5.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                            color: AppColors.maincolor
                                                .withOpacity(0.1),
                                          ),
                                        ],
                                      ),
                                      width: 120,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${imageUrl}/${data.doctorImage.toString()}',
                                      ),
                                      // width: 120,
                                    ),
                                    Text(
                                      data.experience!,
                                      style: BaseStyles.whiteBold13,
                                      textAlign: TextAlign.center,
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
                                      data.doctorName!,
                                      style: BaseStyles.blackMedium13,
                                    ),
                                    heightSpace10,
                                    Text(
                                      data.description!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: BaseStyles.blackMedium13,
                                    ),
                                    heightSpace10,
                                    Text(
                                      data.languages!,
                                      style: BaseStyles.blackMedium13,
                                    ),
                                    heightSpace20,
                                    Row(
                                      children: [
                                        Text(
                                          '₹ ${data.realRate.toString()} ',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          ' | ₹ ${data.offerRate.toString()}',
                                          style: BaseStyles.blackMedium13,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          RatingBarIndicator(
                                            rating: data.rating!.toDouble(),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: AppColors.maincolor,
                                            ),
                                            itemCount: 5,
                                            itemSize: 25.0,
                                            unratedColor: AppColors.grey,
                                            direction: Axis.horizontal,
                                          ),
                                          widthSpace10,
                                          Expanded(
                                            child: Text(
                                              '${data.rating!.toDouble().toString()}',
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
                              Get.toNamed('/slots', arguments: {'id': data.id});
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      color:
                                          AppColors.maincolor.withOpacity(0.1),
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
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
}
