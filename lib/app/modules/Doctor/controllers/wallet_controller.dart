import 'package:doctor_app/app/modules/Doctor/Provider/api_doctor_provider.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final deposit = [].obs;
  final withdraw = [].obs;
  final index = 0.obs;
  final totalamount = ''.obs;
  late TabController tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Withdraw'),
    Tab(text: 'Deposite'),
  ];
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    withdrawC();
    depositeC();
    totalamountC();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  withdrawC() async {
    try {
      var data = {'doctorId': getid(), 'type': 'withdraw'};
      var res = await ApiDoctorProvider().walletP(data);
      // doctorimagepath = res['url'];
      withdraw.value = res['withdraw'];
      print(res);
      // doctordata.value = res['doctor'];

      withdraw.addAll(res['withdraw']);
      // loading.value = false;
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }

  depositeC() async {
    try {
      var data = {'doctorId': getid(), 'type': 'deposit'};
      print(getid());
      var res = await ApiDoctorProvider().walletP(data);
      // doctorimagepath = res['url'];
      // deposit.value = res['deposite'];

      // doctordata.value = res['doctor'];
      print(res);
      deposit.addAll(res['deposite']);
      print(deposit);
      // loading.value = false;
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }

  totalamountC() async {
    try {
      var data = {
        'doctorId': getid(),
      };
      print(getid());
      var res = await ApiDoctorProvider().totalwalletP(data);
      totalamount.value = res['deposite'].toString();
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }
}
