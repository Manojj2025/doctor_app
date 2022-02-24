import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';

import '../../../widget/gettoken.dart';

class TestreportDetailsController extends GetxController {
  //TODO: Implement TestreportDetailsController

  var type = Get.arguments['name'];
  final history = [].obs;
  final histroydate = [].obs;
  @override
  void onInit() {
    super.onInit();
    patient_old_checkC();
    print(type);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  patient_old_checkC() async {
    try {
      var data = {'userId': getid(), 'type': type};
      var res = await ApiProvider().patient_old_checkP(data);
      history.clear();
      history.addAll(res['data']);
      // histroydate.addAll(res['data']);
      print(res['data']);
      // loading.value = false;
      print(res);
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
  }
}
