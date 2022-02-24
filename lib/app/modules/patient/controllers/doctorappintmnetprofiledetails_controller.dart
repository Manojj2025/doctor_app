import 'package:get/get.dart';

class DoctorappintmnetprofiledetailsController extends GetxController {
  var doctordetails = Get.arguments['doctor_detail'];
  var url = Get.arguments['url'];

  final loading = false.obs;
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
}
