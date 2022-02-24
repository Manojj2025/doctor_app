import 'package:doctor_app/app/modules/patient/controllers/bottom_bar_c_controller.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/modules/patient/views/sucess_view.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'doctor_appointment_controller.dart';

class BookappointmentController extends GetxController {
  final date = Get.arguments['date'];
  final time = Get.arguments['time'];
  final url = Get.arguments['url'];
  final doctor = Get.arguments['doctor'];
  final patientList = [].obs;
  final patientLoading = true.obs;
  final select_symptoms = [].obs;
  final select_symptoms_other = [].obs;
  late TextEditingController selfnamed;
  late TextEditingController selfage;
  late TextEditingController othername;
  late TextEditingController otherage;
  late TextEditingController other_symptoms;
  final othergender = ''.obs;
  var id_d = Get.find<DoctorAppointmentController>().id;
  late TextEditingController otherelation;
  var data = Get.find<BottomBarController>().profile_data;
  var symptomsdata = Get.find<DoctorAppointmentController>().symptoms;
  final value = false.obs;
  final othersys = [].obs;
  final id = 1.obs;
  final selfgender = ''.obs;
  final book_id = 0.obs;

  @override
  void onInit() {
    super.onInit();

    selfnamed = TextEditingController(text: data['name']);
    selfage = TextEditingController(text: data['age'].toString());
    selfgender.value = data['gender'];
    othername = TextEditingController();
    otherage = TextEditingController();
    otherelation = TextEditingController();
    other_symptoms = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  accountSelf_c() async {
    var symptoms = List.generate(
        select_symptoms.length, (index) => select_symptoms[index]['name']);
    var symptomsother = List.generate(
        select_symptoms_other.length, (index) => select_symptoms_other[index]);
    if (selfnamed.text == '') {
      showToast('fill your name');
    } else if (selfgender == '') {
      showToast('fill your gender');
    } else if (selfage.text == '') {
      showToast('fill your age');
    } else if (symptoms.length == 0 && other_symptoms.text == '') {
      showToast('Please Select Your Other Symptoms');
    } else {
      pleaseWait();
      try {
        var data = {
          'doctorId': id_d,
          'name': selfnamed.text,
          'gender': selfgender.value,
          'age': selfage.text,
          'amount': doctor['amount'],
          'other_Symptoms': symptomsother.toString(),
          'symptoms': symptoms.toString(),
          'appointmentFor': 'Self',
          'dateSlot': date.toString().substring(0, 10),
          'timeSlot': time.toString(),
        };
        print(data);
        var res = await ApiProvider().BookappointmentP(data);
        book_id.value = res['booking_id'];
        print(res);
        print(data);
        showToast(res['message']);
        Get.offAll(() => SucessView(),
            arguments: {'booking_id': book_id.value});
      } catch (e) {
        showToast(e.toString());
        print(e.toString());
      }
      Get.back();
    }
  }

  accountOther_c() async {
    var symptoms = List.generate(
        select_symptoms.length, (index) => select_symptoms[index]['name']);
    if (othername.text == '') {
      showToast('fill your name');
    } else if (othergender == '') {
      showToast('fill your gender');
    } else if (otherage.text == '') {
      showToast('fill your age');
    } else if (symptoms.length == 0) {
      showToast('Please Select Your Symptoms');
    } else {
      pleaseWait();
      try {
        var data = {
          'doctorId': id_d,
          'name': othername.text,
          'gender': othergender.value,
          'age': otherage.text,
          'relation': otherelation.text,
          'amount': doctor['amount'],
          'other_Symptoms': other_symptoms.text,
          'symptoms': symptoms.toString(),
          'appointmentFor': 'Other',
          'dateSlot': date.toString().substring(0, 10),
          'timeSlot': time.toString(),
        };
        print(data);
        var res = await ApiProvider().BookappointmentP(data);

        print(res);

        showToast(res['message']);
        Get.offAll(() => SucessView());
      } catch (e) {
        showToast(e.toString());
        print(e.toString());
      }
      Get.back();
    }
  }
  // }

  // categorySelected(bool selected, id) {
  //   if (selected == true) {
  //     selecteCategorys.add(id);
  //     print(selected);
  //   } else {
  //     selecteCategorys.remove(id);
  //   }
  // }
  //  getPatients() async {
  //   try {
  //     var res = await PatientDirectoryProvider().getPatients();
  //     patientList.clear();
  //     patientList.addAll(res);
  //   } catch (e) {
  //     print(e);
  //     Fluttertoast.showToast(
  //       msg: e.toString(),
  //       backgroundColor: Colors.black,
  //       textColor: whiteColor,
  //     );
  //   }
  //   patientLoading.value = false;
  // }

}
