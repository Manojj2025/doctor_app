import 'package:doctor_app/app/modules/Doctor/Provider/api_doctor_provider.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';

class AppointmentDetailController extends GetxController {
  //TODO: Implement AppointmentDetailController

  final patientlist = {}.obs;
  var patient_id = Get.arguments['appointment_id'];
  late Stream chatRooms;
  @override
  void onInit() {
    super.onInit();
    DoctorappointmentdC();
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

  DoctorappointmentdC() async {
    try {
      var id = {'appointment_id': patient_id};
      var res = await ApiDoctorProvider().DoctorappointmentdP(id);

      patientlist.addAll(res['data']);
      // loading.value = false;
      print(patientlist.toString());
      // print(doctorbooked.toString());
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }
}
