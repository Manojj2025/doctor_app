import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyappointmentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final booked = [].obs;
  final cancelled = [].obs;
  final cancelid = [].obs;
  final index = 0.obs;
  var doctorimg = '';
  final delete = false.obs;
  late TabController tabController;
  late Stream chatRooms;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Scheduled'),
    Tab(text: 'Completed'),
    Tab(text: 'Cancelled'),
  ];
  TextEditingController reasontxt = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: myTabs.length, vsync: this);
    Bookc();
    // getUserInfogetChats();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  // getUserInfogetChats() async {
  //   Constants.myName = (await HelperFunctions.getUserNameSharedPreference())!;
  //   DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
  //     chatRooms = snapshots;
  //     print(
  //         "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
  //   });
  // }

  Bookc() async {
    try {
      // booked.clear();
      var res = await ApiProvider().BookshowP();

      booked.addAll(res['Scheduled_data']);
      doctorimg = res['URL'];
      cancelled.addAll(res['Cancelled']);
      print(doctorimg);
      print(booked.toString());
      // print(cancelled.toString());
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }

  Bookcancelled(id, reason) async {
    try {
      print(id);
      var res = await ApiProvider().cancelledappointmentP(id, reason);

      showToast(res['message'].toString());
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }
}
