import 'dart:io';

import 'package:doctor_app/app/widget/gettoken.dart';

import 'package:get/get.dart';

import '../../../../baseurl.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> mobileLoginP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res =
        await post('login', data, headers: {'Accept': 'application/json'});
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> verifyOtp(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('otp-verify', data);
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.statusCode == 401) {
      return Future.error(res.body);
    } else {
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> BannerP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('banner', headers: {
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

  Future<dynamic> SelfcheckP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('self-check', headers: {
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

  Future<dynamic> Diseases_specialistP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('diseases-specialist', data, headers: {
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

  Future<dynamic> consultP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('consult', headers: {
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

  Future<dynamic> DiseaseSpacialistdoctordetailP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('specialist-diseases-doctor-list', data, headers: {
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

  Future<dynamic> pushnotification(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('push-notification', data, headers: {
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

  Future<dynamic> changeProfilePhoto(data) async {
    httpClient.baseUrl = BASE_URL;
    File file = new File(data['image']);
    Map<String, dynamic> formData = Map<String, dynamic>.from(data);
    formData.addAll({
      'image': MultipartFile(file, filename: data['image']),
    });
    final form = FormData(formData);

    var res = await post('patient-image', form, headers: {
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

  Future<dynamic> account_p(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('patientacount', data, headers: {
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

  Future<dynamic> account_profile() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('patientacount-detail', headers: {
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

  Future<dynamic> doctortimeslot_p(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('timeslots', data, headers: {
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

  Future<dynamic> symptomsP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('symptoms', headers: {
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

  Future<dynamic> BookappointmentP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('book-appointment', data, headers: {
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

  Future<dynamic> BookshowP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('get-patient-appointment-data', headers: {
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

  Future<dynamic> cancelledappointmentP(id, reason) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('Paitent-cancelled-appointment', {
      'appointment_id': id,
      'delete_reason': reason
    }, headers: {
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

  Future<dynamic> accountimageP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('get-profile-image', headers: {
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

  Future<dynamic> searchP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('doctor-searching', data, headers: {
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

  Future<dynamic> logoutP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('logout', headers: {
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

  Future<dynamic> hardware_readP() async {
    httpClient.baseUrl = BASE_URL;
    var res = await get('patient-Test-Report', headers: {
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

  Future<dynamic> hardware_postP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('patient-testing', data, headers: {
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

  Future<dynamic> bookedtimeP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('doctor-appointment-booked-time', data, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${getToken()}"
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      // print(res.statusText);
      return Future.error('Something went wrong please try again later');
    }
  }

  Future<dynamic> patient_latest_checkP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('patient-testing-data-latest', data, headers: {
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

  Future<dynamic> patient_old_checkP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('patient-testing-data', data, headers: {
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
