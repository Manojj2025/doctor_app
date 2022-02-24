import 'dart:io';

import 'package:doctor_app/app/widget/gettoken.dart';
import 'package:get/get.dart';
import '../../../../baseurl.dart';

class ApiDoctorProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> DoctorshowP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('get-doctor-appointment-data', headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> getdoctorimageP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('get-doctor-profile-image', headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> profiledoctorP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('doctor-profile', data, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> DoctorappointmentdP(id) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('get-patient-appointment-data-details', id, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> walletP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('doctor-wallet-list', data, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> totalwalletP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('doctor-wallet-amount', data, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> doctorimageP(data) async {
    httpClient.baseUrl = BASE_URL;
    File file = new File(data['image']);
    Map<String, dynamic> formData = Map<String, dynamic>.from(data);
    formData.addAll({
      'image': MultipartFile(file, filename: data['image']),
    });
    final form = FormData(formData);

    var res = await post('doctor-profile-image', form, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      Future.error(res.body['message']);
    } else if (res.statusCode == 500) {
      print(res.statusCode);
      return Future.error(res.body);
    } else {
      return Future.error('Network error');
    }
  }

  Future<dynamic> account_profile() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('get-doctor-profile-data', headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }
}
