import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/modules/patient/views/account_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/consultPatient_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/home_c_view.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomBarController extends GetxController {
  final currentIndex = 0.obs;
  late DateTime currentBackPressTime;
  var box = GetStorage();
  final profile_data = {}.obs;
  DateTime timer = DateTime.now();
  List children = [HomeView(), ConsultPView(), ProfileCView()];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    account_profile();
    account_imageC();
  }

  @override
  void onClose() {}
  onTabTapped(int index) {
    currentIndex.value = index;
  }

  account_imageC() async {
    try {
      var res = await ApiProvider().accountimageP();
      // image.addAll(res['data']);
      // image_path = res['url1'];

      print(res.toString() + 'manoj');
      box.write('imageurl', '${res['url1']}/${res['data']['profileImage']}');
      print('${res['url1']}/${res['data']['profileImage']}');
      // print(image_path);
      // print(image);
    } catch (e) {
      showToast(e.toString());
    }
  }

  account_profile() async {
    try {
      var res = await ApiProvider().account_profile();
      profile_data.value = res['data'];
      box.write('dPid', res['data']['id']);
      box.write('patient_name', res['data']['name']);
      box.write('name', res['data']['name']);
      print(res['data']['id']);

      // FirebaseFirestore.instance
      //               .collection('data')
      //               .add({'user_id': res['data']['id'],'user_name':res['data']['name']});

    } catch (e) {
      showToast(e.toString());
    }
  }
}
