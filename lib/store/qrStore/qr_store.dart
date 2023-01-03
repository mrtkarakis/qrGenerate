import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
part 'qr_store.g.dart';

// ignore: library_private_types_in_public_api
class QrStore = _QrStoreBase with _$QrStore;

abstract class _QrStoreBase with Store {
  @observable
  String data = "https://www.mertkarakis.dev/";

  @action
  String setQrData(String? text) =>
      data = text != null && text.isNotEmpty ? text : data;

  @observable
  Color backgroundColor = Colors.white;

  @action
  Color setBackgroundColor(Color color) {
    backgroundColor = color;
    return backgroundColor;
  }

  @observable
  QrDataModuleStyle dataModuleStyle = const QrDataModuleStyle(
      color: Colors.black, dataModuleShape: QrDataModuleShape.square);

  @action
  QrDataModuleStyle setDataModuleStyle(
      {Color? color, QrDataModuleShape? qrDataModuleShape}) {
    color = color ?? dataModuleStyle.color;
    qrDataModuleShape = qrDataModuleShape ?? dataModuleStyle.dataModuleShape;
    dataModuleStyle =
        QrDataModuleStyle(color: color, dataModuleShape: qrDataModuleShape);
    return dataModuleStyle;
  }

  @observable
  QrEyeStyle eyeStyle =
      const QrEyeStyle(color: Colors.black, eyeShape: QrEyeShape.square);

  @action
  QrEyeStyle setEyeStyle({Color? color, QrEyeShape? eyeShape}) {
    color = color ?? eyeStyle.color;
    eyeShape = eyeShape ?? eyeStyle.eyeShape;
    eyeStyle = QrEyeStyle(color: color, eyeShape: eyeShape);
    return eyeStyle;
  }

  @observable
  Color? foregroundColor;

  @action
  Color setForegroundColor(Color color) {
    foregroundColor = color;
    return color;
  }

  @observable
  bool gapless = true;

  @observable
  EdgeInsets padding = const EdgeInsets.all(6); // limit

  TextEditingController qrTextEditingController = TextEditingController();
}
