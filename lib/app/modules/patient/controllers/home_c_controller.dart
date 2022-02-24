import 'package:doctor_app/app/modules/patient/models/banner_model.dart';
import 'package:doctor_app/app/modules/patient/models/diseases_spacialist_model.dart';
import 'package:doctor_app/app/modules/patient/models/self_check_model.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:doctor_app/app/widget/please_wait.dart';

import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final loading = true.obs;
  final selectedtab = 0.obs;
  final sliderCurrentIndex = 0.obs;
  final sliders = [].obs;

  final selfcheck = [].obs;
  final diseases = [].obs;
  final specialist = [].obs;
  var imagepathbanner = '';
  var imagepathself = '';
  var imagepathdiseases = '';
  var imagepathspecialist = '';
  final type = ''.obs;
  var disdoctorpath = '';
  var box = GetStorage();

  final limit1 = [].obs;
  final limit2 = [].obs;
  final limit3 = [].obs;

  @override
  void onInit() {
    super.onInit();
    // hardware_readC();
  }

  @override
  void onReady() {
    super.onReady();
    getSliderC();
    selfCheckC();
    Diseases_C();
    specialistC();
  }

  @override
  void onClose() {}
  getSliderC() async {
    try {
      var res = await ApiProvider().BannerP();
      imagepathbanner = res['image_url1'];
      List<BannerImage> finalres = (res['image'] as List)
          .map((item) => BannerImage.fromJson(item))
          .toList();
      sliders.addAll(finalres);
      loading.value = false;
    } catch (e) {
      showToast(e.toString());
    }
  }

  selfCheckC() async {
    try {
      var res = await ApiProvider().SelfcheckP();
      imagepathself = res['image_url1'];
      List<SelfImage> finalres = (res['image'] as List)
          .map((item) => SelfImage.fromJson(item))
          .toList();
      selfcheck.addAll(finalres);
      limit1.addAll(selfcheck.sublist(0, 9));
      loading.value = false;
      print(res);
    } catch (e) {
      showToast(e.toString());
    }
  }

  Diseases_C() async {
    try {
      var data = {"type": "diseases"};
      var res = await ApiProvider().Diseases_specialistP(data);
      imagepathdiseases = res['image_url'];
      List<DSImage> finalres =
          (res['image'] as List).map((item) => DSImage.fromJson(item)).toList();

      diseases.addAll(finalres);
      limit2.addAll(diseases.sublist(0, 8));
      loading.value = false;
      box.write('id', res['id']);
    } catch (e) {
      showToast(e.toString());
    }
  }

  specialistC() async {
    try {
      var data = {"type": "specialist"};
      var res = await ApiProvider().Diseases_specialistP(data);
      imagepathspecialist = res['image_url'];
      List<DSImage> finalres =
          (res['image'] as List).map((item) => DSImage.fromJson(item)).toList();

      specialist.addAll(finalres);
      limit3.addAll(specialist.sublist(0, 6));
      loading.value = false;
    } catch (e) {
      showToast(e.toString());
    }
  }

  logoutC() async {
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
}
