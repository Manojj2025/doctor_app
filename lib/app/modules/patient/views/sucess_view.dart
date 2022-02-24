import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/views/bottom_bar_c_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

class SucessView extends GetView {
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments['booking_id'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Thank You', style: BaseStyles.whiteb18),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/sucess.png'),
          Expanded(
            child: Column(
              children: [
                heightSpace20,
                Text('Success Order', style: BaseStyles.green20bold),
                heightSpace20,
                Text('Appointment Id    :   ${id}', style: BaseStyles.grey15),
                heightSpace20,
              ],
            ),
          ),
          Expanded(
              child: Text('Thank You For Success Order',
                  style: BaseStyles.blackBold18)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            // Get.dialog(
            //   Dialog(
            //     shape: RoundedRectangleBorder(
            //         borderRadius:
            //             BorderRadius.circular(20.0)), //this right here
            //     child: Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // Center(
            //           //   child: Text(
            //           //     'Delete Patient',
            //           //     style: TextStyle(
            //           //       fontWeight: FontWeight.bold,
            //           //       fontSize: 20,
            //           //     ),
            //           //   ),
            //           // ),
            //           // SizedBox(height: 10),
            //           Text(
            //             'Your Feedback',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w400,
            //               fontSize: 17,
            //             ),
            //           ),
            //           SizedBox(height: 10),
            //           Align(
            //             alignment: Alignment.centerRight,
            //             child: Row(
            //               children: [
            //                 RatingBarIndicator(
            //                   // rating: data.rating!.toDouble(),
            //                   itemBuilder: (context, index) => Icon(
            //                     Icons.star,
            //                     color: AppColors.maincolor,
            //                   ),
            //                   itemCount: 5,
            //                   itemSize: 25.0,
            //                   unratedColor: AppColors.grey,
            //                   direction: Axis.horizontal,
            //                 ),
            //                 // widthSpace10,
            //                 // Expanded(
            //                 //   child: Text(
            //                 //     '${data.rating!.toDouble().toString()}',
            //                 //     style: BaseStyles.blackBold15,
            //                 //   ),
            //                 // )
            //               ],
            //             ),
            //           ),
            //           SizedBox(height: 10),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               Expanded(
            //                 child: GestureDetector(
            //                   onTap: () {
            //                     Get.back();
            //                   },
            //                   child: Container(
            //                       alignment: Alignment.center,
            //                       height: 35,
            //                       width: 80,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(5),
            //                           color: AppColors.maincolor),
            //                       child: Text('Cancel')),
            //                 ),
            //               ),
            //               SizedBox(width: 20),
            //               Expanded(
            //                 child: GestureDetector(
            //                   onTap: () {},
            //                   child: Container(
            //                       alignment: Alignment.center,
            //                       height: 35,
            //                       width: 80,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(5),
            //                           color: AppColors.maincolor),
            //                       child: Text('Delete',
            //                           style: BaseStyles.whiteBold15)),
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // );
            Get.back();
            Get.offAll(() => BottomBarView());
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: AppColors.maincolor,
            ),
            child: Text(
              'Success',
              style: BaseStyles.whiteBold15,
            ),
          ),
        ),
      ),
    );
  }
}
