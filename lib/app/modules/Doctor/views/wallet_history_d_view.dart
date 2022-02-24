import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WalletHistoryView extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WalletController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
              onTap: (index) {
                controller.index.value = index;
                controller.tabController.index = index;

                print(index);
                print(controller.tabController.index);

                // print(controller.type.value.toString());
                // controller.Bookc();
              },
              indicatorColor: AppColors.maincolor,
              tabs: controller.myTabs),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Appointment'),
              Obx(
                () => Text(
                  'Total: \₹${controller.totalamount.value.toString()}',
                  style: BaseStyles.whiteBold13,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [Withdraw(), Deposite()],
        ),
      ),
    );
  }

  Withdraw() {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controller.withdraw.length,
          itemBuilder: (BuildContext context, int index) {
            final data = controller.withdraw[index];
            // print(controller.withdraw[index]['appointment_id'].toString());
            print(data.toString());
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Obx(
                  () => Container(
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Align(
                          //     alignment: Alignment.topRight,
                          //     child: Icon(
                          //       Icons.more_horiz,
                          //       size: 25,
                          //       color: AppColors.maincolor,
                          //     )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'payment_status: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '${controller.withdraw[index]['payment_status'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'booking_id: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '${controller.withdraw[index]['booking_id'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          heightSpace10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'amount: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '\₹${controller.withdraw[index]['amount'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Charges: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '\₹${controller.withdraw[index]['comission_amount'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          heightSpace10,
                          Row(
                            children: [
                              Text(
                                'Doctor Charges: ',
                                style: BaseStyles.mainMedium15,
                              ),
                              Text(
                                '\₹${controller.withdraw[index]['comission_amount'].toString()} consultation charge',
                                style: BaseStyles.grey15,
                              ),
                            ],
                          ),
                          // heightSpace10,
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       'Doctor Specilist: ',
                          //       style: BaseStyles.mainMedium15,
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       '${controller.withdraw[index]['specilist'].toString()}',
                          //       style: BaseStyles.grey15,
                          //     )),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Deposite() {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controller.deposit.length,
          itemBuilder: (BuildContext context, int index) {
            final data = controller.deposit[index];
            // print(controller.withdraw[index]['appointment_id'].toString());
            print(data.toString());
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Obx(
                  () => Container(
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Align(
                          //     alignment: Alignment.topRight,
                          //     child: Icon(
                          //       Icons.more_horiz,
                          //       size: 25,
                          //       color: AppColors.maincolor,
                          //     )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'payment_status: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '${controller.deposit[index]['payment_status'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'booking_id: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '${controller.deposit[index]['booking_id'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          heightSpace10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'amount: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '\₹${controller.deposit[index]['amount'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Charges: ',
                                    style: BaseStyles.mainMedium15,
                                  ),
                                  Text(
                                    '\₹${controller.deposit[index]['comission_amount'].toString()}',
                                    style: BaseStyles.grey15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          heightSpace10,
                          Row(
                            children: [
                              Text(
                                'Doctor Charges: ',
                                style: BaseStyles.mainMedium15,
                              ),
                              Text(
                                '\₹${controller.deposit[index]['comission_amount'].toString()} consultation charge',
                                style: BaseStyles.grey15,
                              ),
                            ],
                          ),
                          // heightSpace10,
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       'Doctor Specilist: ',
                          //       style: BaseStyles.mainMedium15,
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       '${controller.withdraw[index]['specilist'].toString()}',
                          //       style: BaseStyles.grey15,
                          //     )),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
