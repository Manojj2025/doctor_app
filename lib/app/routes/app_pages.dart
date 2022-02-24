import 'package:doctor_app/app/agora_video/views/agora_video_c_view.dart';
import 'package:doctor_app/app/agora_video/views/call_page_view.dart';
import 'package:doctor_app/app/modules/Doctor/views/bottombar_d_view.dart';

import 'package:doctor_app/app/modules/Doctor/views/appointment_d_view.dart';
import 'package:doctor_app/app/modules/Doctor/views/notification_d_view.dart';
import 'package:doctor_app/app/modules/Doctor/views/patient_report_d_view.dart';
import 'package:doctor_app/app/modules/Doctor/views/profile_d_view.dart';
import 'package:doctor_app/app/modules/Doctor/views/wallet_history_d_view.dart';
import 'package:doctor_app/app/modules/patient/views/account_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/bookappointment_view.dart';
import 'package:doctor_app/app/modules/patient/views/bottom_bar_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/consultPatient_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/doctor_appointment_view.dart';
import 'package:doctor_app/app/modules/patient/views/home_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/homedetails_view.dart';
import 'package:doctor_app/app/modules/patient/views/login_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/myappointment_view.dart';
import 'package:doctor_app/app/modules/patient/views/otp_c_view.dart';
import 'package:doctor_app/app/modules/patient/views/patientdirectory_view.dart';
import 'package:doctor_app/app/modules/patient/views/selfcheck_details_view.dart';
import 'package:doctor_app/app/modules/patient/views/splash_view.dart';
import 'package:doctor_app/app/modules/patient/views/view_all_ds_view.dart';
import 'package:doctor_app/app/modules/patient/views/view_all_selfcheck.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
//customer routes////////////////////////////////
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
    ),
    GetPage(
      name: _Paths.BOTTOMC,
      page: () => BottomBarView(),
    ),
    GetPage(
      name: _Paths.HOMEC,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.CONSULTC,
      page: () => ConsultPView(),
    ),
    GetPage(
      name: _Paths.BOOKED,
      page: () => MyappointmentView(),
    ),
    GetPage(
      name: _Paths.BOOKAPPOINTMENT,
      page: () => BookappointmentView(),
    ),
    GetPage(
      name: _Paths.ADDPATIENT,
      page: () => PatientdirectoryView(),
    ),
    GetPage(
      name: _Paths.ACCOUNTC,
      page: () => ProfileCView(),
    ),
    GetPage(
      name: _Paths.HOMEDETAIL,
      page: () => HomedetailsView(),
    ),
    GetPage(
      name: _Paths.SELFCHECK,
      page: () => SelfcheckDetailsView(),
    ),
    GetPage(
      name: _Paths.AGORACALL,
      page: () => CallPageView(),
    ),
    GetPage(
      name: _Paths.AGORAVIDEO,
      page: () => AgoraVideoCView(),
    ),
    GetPage(
      name: _Paths.DSVIEW_ALL,
      page: () => ViewallView(),
    ),
    GetPage(
      name: _Paths.SELFVIEW_ALL,
      page: () => SelfCheckViewall(),
    ),
    GetPage(
      name: _Paths.SLOTS,
      page: () => TimeSlotsView(),
    ),

    //doctor routes////////////////////////////////

    GetPage(
      name: _Paths.MYAPPOINTMENT,
      page: () => AppointmentView(),
    ),
    GetPage(
      name: _Paths.WALLETHISTORY,
      page: () => WalletHistoryView(),
    ),
    GetPage(
      name: _Paths.MYPROFILE,
      page: () => ProfileView(),
    ),
    GetPage(
      name: _Paths.BOTTOMD,
      page: () => BottombarView(),
    ),
    GetPage(
      name: _Paths.PATIENTREPORT,
      page: () => PatientReportView(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
    ),
  ];
}
