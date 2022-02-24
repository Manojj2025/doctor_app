import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(msg, {long}) {
  if (!kIsWeb) Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    // toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
  );
}
