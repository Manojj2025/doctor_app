import 'package:doctor_app/app/modules/Doctor/Provider/api_doctor_provider.dart';
import 'package:doctor_app/app/modules/Doctor/controllers/profile_d_controller.dart';
import 'package:doctor_app/app/modules/Doctor/views/bottombar_d_view.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImagedoctorController extends GetxController {
  //TODO: Implement ImagedoctorController
  final imageDUpdate = Get.find<ProfileController>().image_path.obs;
  var box = GetStorage();
  late XFile pickedFile;
  var selectedImagepath = ''.obs;
  var selectedImageSize = ''.obs;
  final pickFileLoading = false.obs;
  final isfilepicked = false.obs;
  var fileName = ''.obs;
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
  imagecontroller(ImageSource imageSource) async {
    pickedFile = (await ImagePicker().pickImage(source: imageSource))!;
    print(pickedFile.toString() + "manoj1");
    if (pickedFile != '') {
      selectedImagepath.value = pickedFile.path;
      pickFileLoading.value = true;
      isfilepicked.value = true;
      fileName.value = pickedFile.path.split('/').last;
    } else {}
  }

  ChangePhoto() async {
    pleaseWait();
    var data = {
      "image": pickedFile.path.toString(),
    };
    print(data);

    try {
      if (pickedFile.path.toString() == '') {
        showToast('Please select Image');
      } else {
        var res = await ApiDoctorProvider().doctorimageP(data);

        print(res);
        Get.back();
        // Get.back();
        print(res);
        showToast(res['message']);
        var c = Get.find<ProfileController>();
        Get.back();
        c.get_imageC();
        print(res.toString());
      }
    } catch (e) {
      showToast(e.toString());
      Get.back();
      print('manoj2' + e.toString());
    }
  }
}
