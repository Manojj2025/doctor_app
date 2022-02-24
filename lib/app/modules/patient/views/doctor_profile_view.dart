import 'package:doctor_app/app/constants/app_basestyles.dart';
import 'package:doctor_app/app/constants/app_colors.dart';
import 'package:doctor_app/app/modules/patient/controllers/doctor_profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DoctorProfileView extends GetView<DoctorProfileController> {
  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    var height = Get.height;
    Get.lazyPut(() => DoctorProfileController());
    return Scaffold(
      backgroundColor: AppColors.maincolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: (height * 0.36),
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: (width - fixPadding * 11.0) / 2.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr.' + controller.doctor['username'],
                        style: BaseStyles.whiteBold15,
                      ),
                      heightSpace20,
                      Text(
                        controller.doctor['education'],
                        style: BaseStyles.whiteBold15,
                      ),
                      heightSpace20,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Icon(Icons.star, color: Colors.lime, size: 20.0),
                      //     SizedBox(width: 5.0),
                      //     Text(
                      //       '4.5 Rating',
                      //       style: whiteColorNormalTextStyle,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Hero(
                  tag: 'yhgjgytujyt',
                  child: controller.doctor['profileImage'] != null
                      ? Image.network(
                          '${controller.url}/${controller.doctor['profileImage'].toString()}',
                          width: (width) / 2.0,
                          height: Get.height / 3.2,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/icons/default_doctor.png',
                          width: (width) / 2.0,
                          height: Get.height / 3.2,
                          fit: BoxFit.contain,
                        ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder: (BuildContext context, myscrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                child: Container(
                  color: AppColors.whiteColor,
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: ListView(
                    controller: myscrollController,
                    children: [
                      // Text(
                      //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      //   style: greyNormalTextStyle,
                      //   textAlign: TextAlign.justify,
                      // ),
                      // heightSpace,
                      heightSpace10,
                      experience(controller.doctor),
                      heightSpace20,

                      // availability(controller.doctor),
                      heightSpace20,
                      // location(),
                      experties(controller.doctor),
                      heightSpace20,
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  experience(doctor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: BaseStyles.blackBold14,
        ),
        heightSpace10,
        Text(
          '${controller.doctor['experience']} Years',
          style: BaseStyles.grey15,
        ),
      ],
    );
  }

  experties(doctor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experties',
          style: BaseStyles.blackBold14,
        ),
        heightSpace10,
        Text(
          '${controller.doctor['education']}',
          style: BaseStyles.grey15,
        ),
      ],
    );
  }

  // availability(doctor) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Availability',
  //         style: BaseStyles.black15,
  //       ),
  //       heightSpace10,
  //       Text(
  //         '${controller.doctor['doctor']['open_time']} - ${controller.doctor['doctor']['close_time']}',
  //         style: BaseStyles.black15,
  //       ),
  //     ],
  //   );
  // }

  location() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: BaseStyles.black15,
        ),
        heightSpace10,
        Text(
          '${controller.doctor['location']}',
          style: BaseStyles.grey15,
        ),
      ],
    );
  }

  // review() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Review',
  //         style: blackHeadingTextStyle,
  //       ),
  //       heightSpace,
  //       ColumnBuilder(
  //         itemCount: 3,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.max,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         itemBuilder: (context, index) {
  //           final item = ratingList[index];
  //           return Container(
  //             margin: (index == 0)
  //                 ? EdgeInsets.symmetric(horizontal: 2.0)
  //                 : EdgeInsets.only(
  //                     top: fixPadding * 2.0, right: 2.0, left: 2.0),
  //             padding: EdgeInsets.all(fixPadding * 2.0),
  //             decoration: BoxDecoration(
  //               color: whiteColor,
  //               borderRadius: BorderRadius.circular(15.0),
  //               boxShadow: <BoxShadow>[
  //                 BoxShadow(
  //                   blurRadius: 1.0,
  //                   spreadRadius: 1.0,
  //                   color: Colors.grey[300],
  //                 ),
  //               ],
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       width: 70.0,
  //                       height: 70.0,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(35.0),
  //                         image: DecorationImage(
  //                           image: AssetImage(item['image']),
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                     widthSpace,
  //                     widthSpace,
  //                     Expanded(
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             item['name'],
  //                             style: blackNormalBoldTextStyle,
  //                           ),
  //                           SizedBox(height: 5.0),
  //                           Text(
  //                             item['time'],
  //                             style: greySmallTextStyle,
  //                           ),
  //                           SizedBox(height: 5.0),
  //                           ratingBar(item['rating']),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 heightSpace,
  //                 Text(
  //                   item['review'],
  //                   style: blackNormalTextStyle,
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //       heightSpace,
  //       heightSpace,
  //       InkWell(
  //         borderRadius: BorderRadius.circular(15.0),
  //         onTap: () {
  //           // Navigator.push(
  //           //     context,
  //           //     PageTransition(
  //           //         duration: Duration(milliseconds: 600),
  //           //         type: PageTransitionType.rightToLeftWithFade,
  //           //         child: Review(
  //           //           reviewList: ratingList,
  //           //         )));
  //         },
  //         child: Container(
  //           padding: EdgeInsets.all(fixPadding * 1.5),
  //           width: double.infinity,
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15.0),
  //             border: Border.all(width: 1.0, color: primaryColor),
  //           ),
  //           child: Text(
  //             'Show all reviews',
  //             style: primaryColorsmallBoldTextStyle,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // ratingBar(number) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       // 1 Star
  //       Icon(
  //         (number == 1 ||
  //                 number == 2 ||
  //                 number == 3 ||
  //                 number == 4 ||
  //                 number == 5)
  //             ? Icons.star
  //             : Icons.star_border,
  //         color: Colors.lime[600],
  //         size: 18.0,
  //       ),

  //       // 2 Star
  //       Icon(
  //         (number == 2 || number == 3 || number == 4 || number == 5)
  //             ? Icons.star
  //             : Icons.star_border,
  //         color: Colors.lime[600],
  //         size: 18.0,
  //       ),

  //       // 3 Star
  //       Icon(
  //         (number == 3 || number == 4 || number == 5)
  //             ? Icons.star
  //             : Icons.star_border,
  //         color: Colors.lime[600],
  //         size: 18.0,
  //       ),

  //       // 4 Star
  //       Icon(
  //         (number == 4 || number == 5) ? Icons.star : Icons.star_border,
  //         color: Colors.lime[600],
  //         size: 18.0,
  //       ),

  //       // 5 Star
  //       Icon(
  //         (number == 5) ? Icons.star : Icons.star_border,
  //         color: Colors.lime[600],
  //         size: 18.0,
  //       ),
  //     ],
  //   );
  // }
}
