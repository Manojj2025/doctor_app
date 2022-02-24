import 'package:get_storage/get_storage.dart';

getToken() {
  var box = GetStorage();
  return box.read('token') ?? '';
}

getid() {
  var box = GetStorage();
  return box.read('dPid') ?? '';
}

getProfileImage() {
  var box = GetStorage();
  var imgurl = box.read('imageurl');
  print(imgurl.toString() + 'manoj');
  return imgurl ?? '';
}

getname() {
  var box = GetStorage();
  var imgurl = box.read('name');
  print(imgurl.toString() + 'manoj');
  return imgurl ?? '';
}

// getpatientname() {
//   var box = GetStorage();
//   print(box.read('patient_name'));
//   return box.read('patient_name') ?? '';
// }

usertype() {
  var box = GetStorage();
  return box.read('user_type') ?? '';
}
