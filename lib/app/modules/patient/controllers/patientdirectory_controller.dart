import 'package:get/get.dart';

class PatientdirectoryController extends GetxController {
  final selfgender = ''.obs;
  final patientList = [].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  // account_c() async {
  //   if (id.value == 1) {
  //     String self = 'Self';
  //     String name = selfnamed.text;
  //     String genderc = selfgender.value;
  //     List symptoms = select_symptoms;
  //     String age = selfage.text;

  //   if (name == '') {
  //     showToast('fill your name');
  //   } else if (genderc == '') {
  //     showToast('fill your gender');
  //   } else if (age == '') {
  //     showToast('fill your age');
  //   } else if (!RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(email)) {
  //     showToast('Please enter a valid email address');
  //   } else if (height == '') {
  //     showToast('fill your height');
  //   } else if (weight == '') {
  //     showToast('fill your weight');
  //   } else if (bloodGroup == '') {
  //     showToast('select bloodGroup');
  //   }

  //     pleaseWait();
  //     try {
  //       var data = {
  //         if()
  //         'doctorId':id_d,
  //         ''
  //         'name': name,
  //         'gender': genderc,
  //         'age': age,
  //         'height': height,
  //         'weight': weight,
  //         'blood_group': bloodGroup,
  //       };
  //       var res = await ApiProvider().account_p(data);

  //       print(res);

  //       showToast('your profile uploaded successfully');
  //       Get.offAll(() => BottomBarView());
  //     } catch (e) {
  //       showToast(e.toString());
  //     }
  //     Get.back();
  //   }
  // }
  // getPatients() async {
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
  // }

  // addPatient() async {
  //   try {
  //     await ApiProvider().BookappointmentP(data);
  //     Get.back();
  //     // textEditingController.text = '';
  //     // getPatients();
  //   } catch (e) {
  //     print(e);
  //     Get.back();
  //     Fluttertoast.showToast(
  //       msg: e.toString(),
  //       backgroundColor: Colors.black,
  //       textColor: whiteColor,
  //     );
  //   }
  // }

  // void deletePatient(id) async {
  //   try {
  //     await PatientDirectoryProvider().deletePatient(id);
  //     Get.back();
  //     getPatients();
  //   } catch (e) {
  //     print(e);
  //     Get.back();
  //     Fluttertoast.showToast(
  //       msg: e.toString(),
  //       backgroundColor: Colors.black,
  //       textColor: whiteColor,
  //     );
  //   }
  // }
}
