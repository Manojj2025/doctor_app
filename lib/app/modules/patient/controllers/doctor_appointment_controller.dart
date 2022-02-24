import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorAppointmentController extends GetxController {
  List<DateTime> initialSelectedDates = [];
  late DateTime firstDate;
  late DateTime lastDate;
  var id = Get.arguments['id'];
  final doctordata = {}.obs;
  var doctorimagepath = '';
  final loading = true.obs;
  DatePickerController controller = DatePickerController();
  final symptoms = [].obs;
  final select_time = ''.obs;
  final status = [].obs;
  final start_time = ''.obs;
  final end_time = ''.obs;
  final select = false.obs;
  DateTime selectedValue = DateTime.now();
  final selectedDay = 0.obs;
  final selectedMonth = 0.obs;
  final selectedDateTime = DateTime.now().obs;
  final monthString = ''.obs;
  final doctorslot = [].obs;
  final forceRender = false.obs;

  int minSelectedDateCount = 1;
  int maxSelectedDateCount = 1;
  late RangeValues selectedDateCount;

  // @override
  void onInit() {
    super.onInit();
    print(id);
    // bookedtimeC(id, "2022-02-10");
    const int days = 30;
    firstDate = toDateMonthYear(DateTime.now());
    lastDate = toDateMonthYear(firstDate.add(Duration(days: days - 1)));
    selectedDateCount = RangeValues(
      minSelectedDateCount.toDouble(),
      maxSelectedDateCount.toDouble(),
    );
    initialSelectedDates = feedInitialSelectedDates(minSelectedDateCount, days);
    selectedDay.value = firstDate.day;
    selectedMonth.value = firstDate.month;
    doctortimeslot_c();
  }

  @override
  void onReady() {
    super.onReady();
    // bookedtimeC();
    // print(Get.arguments);
  }

  @override
  void onClose() {
    // doctordata.clear();
  }
  List<DateTime> feedInitialSelectedDates(int target, int calendarDays) {
    List<DateTime> selectedDates = [];

    for (int i = 0; i < calendarDays; i++) {
      if (selectedDates.length == target) {
        break;
      }
      DateTime date = firstDate.add(Duration(days: i));
      if (date.weekday != DateTime.sunday) {
        selectedDates.add(date);
      }
    }
    return selectedDates;
  }

  DateTime toDateMonthYear(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  setSelectedDateTime() {
    DateTime now = new DateTime.now();

    // DateTime time = DateFormat.jm().parse(select_time.value);
    var month = selectedMonth.value;
    var day = selectedDay.value;
    // var formate1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    // var hour = time.hour;
    // var minute = time.minute;
    // var second = time.second;
    selectedDateTime.value = DateTime(
      now.year,
      month,
      day,
    );
    bookedtimeC(selectedDateTime.value.toString().substring(0, 10));
    // bookedtimeC();
    print(selectedDateTime.value.toString().substring(0, 10));
  }

  doctortimeslot_c() async {
    try {
      var data = {
        'user_id': id,
      };
      var res = await ApiProvider().doctortimeslot_p(data);
      doctorimagepath = res['url'];
      // doctorslot.value = res['data'];
      print(res.toString() + 'manoj');
      // doctordata.value = res['doctor'];

      doctordata.addAll(res['doctor']);
      loading.value = false;
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }

  symptomsC() async {
    try {
      symptoms.clear();
      var res = await ApiProvider().symptomsP();

      print(res);

      symptoms.addAll(res['data']);
      loading.value = false;
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }

  bookedtimeC(date) async {
    select_time.value = '';

    try {
      doctorslot.clear();
      status.clear();
      var data = {'doctorId': id, 'date': date.toString()};
      var res = await ApiProvider().bookedtimeP(data);
      print(res.toString() + 'manojC');
      doctorslot.addAll(res['data']);
      var s = List.generate(res['data'].length,
          (index) => res['data'][index]['status'].toString());
      status.addAll(s);
      loading.value = false;
      print(status);
      // showToast(res['message'].toString());
    } catch (e) {
      print(e.toString() + 'manoj');
      showToast(e.toString());
    }
  }
}
