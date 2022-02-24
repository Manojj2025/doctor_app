import 'package:doctor_app/app/modules/patient/controllers/account_c_controller.dart';
import 'package:doctor_app/app/modules/patient/providers/api_provider_provider.dart';
import 'package:doctor_app/app/modules/patient/views/bottom_bar_c_view.dart';
import 'package:doctor_app/app/widget/please_wait.dart';
import 'package:doctor_app/app/widget/toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreenController extends GetxController {
  final imageupdate = Get.find<AccountController>().image_path.obs;
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
    print(pickedFile.toString() + "manoj");
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
        var res = await ApiProvider().changeProfilePhoto(data);
        // box.write('imageurl', '${res['url']}/${res['image']}');
        // var index = Get.find<BottomBarController>();
        // index.onTabTapped(2);
        Get.back();
        // Get.back();
        print(res);
        showToast(res['message']);
        // Get.offAll(() => BottomBarView());
        var c = Get.find<AccountController>();
        Get.back();
        c.account_imageC();
        print(res.toString());
      }
    } catch (e) {
      showToast(e.toString());
      Get.back();
      print('manoj' + e.toString());
    }
  }
}
