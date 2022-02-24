import 'package:doctor_app/app/modules/patient/controllers/selfcheck_details_controller.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';

import '../../../widget/gettoken.dart';

class TestreportController extends GetxController {
  //TODO: Implement TextreportController

  final loading = true.obs;
  // var m = Get.find<SelfcheckDetailsController>().messages;
  // var data = Get.arguments;
  final bP = [].obs;

  final suger = [].obs;
  final oxi = [].obs;
  final fever = [].obs;
  final hb = [].obs;
  final oxygen = [].obs;
  final air_flow = [].obs;
  final skin = [].obs;
  final position_sensor = [].obs;
  final bpdate = ''.obs;
  final sugerdate = ''.obs;
  final oxidate = ''.obs;
  final feverdate = ''.obs;
  final hbdate = ''.obs;
  final oxygendate = ''.obs;
  final air_flowdate = ''.obs;
  final skindate = ''.obs;
  final position_sensordate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // hardware_readC();
    print(getid());
    patient_latest_checkC();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  // hardware_readC() async {
  //   try {
  //     var res = await ApiProvider().hardware_readP();
  //     hardware.addAll(res['dataUser']);
  //     print(res['dataUser']);
  //     loading.value = false;
  //     print(res);
  //   } catch (e) {
  //     showToast(e.toString());
  //   }
  // }

  patient_latest_checkC() async {
    bP.clear();
    try {
      var data = {'userId': getid()};
      var res = await ApiProvider().patient_latest_checkP(data);

      print(bpdate.value);
      if (res['dataBP'].length != 0) {
        bP.add(res['dataBP'][0]['report']);
        bpdate.value = res['dataBP'][0]['datetime'];
      }
      if (res['dataSugarTest'].length != 0) {
        suger.add(res['dataSugarTest'][0]['report']);
        sugerdate.value = res['dataSugarTest'][0]['datetime'];
      }
      if (res['dataOximeter'].length != 0) {
        oxi.add(res['dataOximeter'][0]['report']);
        oxidate.value = res['dataOximeter'][0]['datetime'];
      }
      if (res['dataFeverTest'].length != 0) {
        fever.add(res['dataFeverTest'][0]['report']);
        feverdate.value = res['dataFeverTest'][0]['datetime'];
      }
      if (res['dataHeartbeat'].length != 0) {
        hb.add(res['dataHeartbeat'][0]['report']);
        hbdate.value = res['dataHeartbeat'][0]['datetime'];
      }
      if (res['dataAirOxygenSupply'].length != 0) {
        oxygen.add(res['dataAirOxygenSupply'][0]['report']);
        oxygendate.value = res['dataAirOxygenSupply'][0]['datetime'];
      }
      if (res['dataAirflowSensor'].length != 0) {
        air_flow.add(res['dataAirflowSensor'][0]['report']);
        air_flowdate.value = res['dataAirflowSensor'][0]['datetime'];
      }
      if (res['dataGalvanicSkinResponse'].length != 0) {
        skin.add(res['dataGalvanicSkinResponse'][0]['report']);
        skindate.value = res['dataGalvanicSkinResponse'][0]['datetime'];
      }
      if (res['dataPositionSensorAccelerometer'].length != 0) {
        position_sensor
            .add(res['dataPositionSensorAccelerometer'][0]['report']);
        position_sensordate.value =
            res['dataPositionSensorAccelerometer'][0]['datetime'];
      }
      loading.value = false;
      // else{
      //   oxygen.a
      // }

      print(res['dataBP']);
      // loading.value = false;
      print(res);
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
  }
}
