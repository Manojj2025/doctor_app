import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/app/constants/global_var.dart';
import 'package:doctor_app/app/modules/Doctor/Provider/api_doctor_provider.dart';
import 'package:doctor_app/app/modules/Doctor/views/appointment_d_view.dart';
import 'package:doctor_app/app/modules/Doctor/views/profile_d_view.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottombarController extends GetxController {
  final currentIndex = 0.obs;
  DateTime timer = DateTime.now();
  List children = [AppointmentView(), ProfileView()];
  var box = GetStorage();
  final profile_data = {}.obs;
  @override
  void onInit() {
    super.onInit();
    account_profile();
    get_imageC();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  onTabTapped(int index) {
    currentIndex.value = index;
  }

  get_imageC() async {
    try {
      var res = await ApiDoctorProvider().getdoctorimageP();
      // loading.value = false;

      // image_path.value = '${res['url']}/${res['profileImage']['image']}';
      box.write('imageurl', '${res['url']}/${res['profileImage']['image']}');
      // loading.value = false;
    } catch (e) {
      showToast(e.toString());
    }
  }

  account_profile() async {
    try {
      var res = await ApiDoctorProvider().account_profile();
      profile_data.value = res['data'];
      box.write('dPid', res['data']['id']);
      box.write('name', res['data']['name']);
      print(res['data']);
    } catch (e) {
      showToast(e.toString());
    }
  }
}
