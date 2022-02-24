import 'package:doctor_app/app/modules/Doctor/Provider/api_doctor_provider.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class appointmentController extends GetxController {
  final today = true.obs;
  final selectedtab = 0.obs;
  final doctorbooked = [].obs;
  var url = '';
  final loading = true.obs;
  var box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Bookc();
    get_imageC();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  get_imageC() async {
    try {
      var res = await ApiDoctorProvider().getdoctorimageP();
      loading.value = false;

      // image_path.value = '${res['url']}/${res['profileImage']['image']}';
      box.write('imageurl', '${res['url']}/${res['profileImage']['image']}');
      loading.value = false;
    } catch (e) {
      showToast(e.toString());
    }
  }

  logout_doctorC() async {
    try {
      var res = await ApiProvider().logoutP();
      pleaseWait();
      box.erase();
      loading.value = false;
      showToast(res['message']);
      Get.toNamed('/login');
    } catch (e) {
      showToast(e.toString());
    }
  }

  Bookc() async {
    try {
      // doctorbooked.clear();
      var res = await ApiDoctorProvider().DoctorshowP();
      url = res['url1'];
      doctorbooked.addAll(res['Scheduled_data']);
      loading.value = false;
      print(url.toString());
      print(doctorbooked.toString());
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }
}
