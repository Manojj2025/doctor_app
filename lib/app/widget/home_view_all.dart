// import 'package:doctor_app/app/constants/values.dart';
// import 'package:doctor_app/app/modules/customer/models/diseases_spacialist_model.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// homeviewall(controller) {
//   return Padding(
//     padding: EdgeInsets.only(bottom: 10.0, top: 10),
//     child: GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
//         itemCount: controller.diseases.length,
//         itemBuilder: (BuildContext context, index) {
//           DSImage item = controller.diseases[index];
//           return GestureDetector(
//             onTap: () {
//               Get.toNamed('/homedetail',
//                   arguments: {'item': item, 'type': 'specialist'});
//             },
//             child: Column(
//               children: [
//                 heightSpace10,
//                 Container(
//                   height: 80,
//                   width: Get.width / 4,
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                         '${controller.imagepathspecialist}/${item.image.toString()}',
//                       ),
//                     ),
//                     color: AppColors.whiteColor,
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                         blurRadius: 5.0,
//                         spreadRadius: 1.0,
//                         color: AppColors.maincolor.withOpacity(0.1),
//                       ),
//                     ],
//                   ),
//                 ),
//                 heightSpace10,
//                 Expanded(
//                   child: Text(
//                     item.title.toString(),
//                     style: BaseStyles.mainMedium13,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 // heightSpace10,
//               ],
//             ),
//           );
//         }),
//   );
// }
