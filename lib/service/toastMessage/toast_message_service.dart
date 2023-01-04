import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_generate/global.dart';

class ToastMessageService {
  static ToastMessageService? _instance;
  static ToastMessageService get instance {
    if (_instance != null) return _instance!;
    _instance = ToastMessageService._init();
    return _instance!;
  }

  ToastMessageService._init();

  void toastMessage(
    String? message, {
    Color backgroundColor = Colors.black45,
    Color textColor = Colors.white,
    double fontSize = 14,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) {
    developerService.developerLog(
      "Message => $message",
      name: "ToastMessageService.toastMessage",
    );
    Fluttertoast.cancel().then(
      (_) => Fluttertoast.showToast(
        msg: "$message",
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        toastLength: toastLength,
        gravity: gravity,
        textColor: textColor,
      ),
    );
  }
}
