import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
part 'qr_store.g.dart';

class QrStore = _QrStoreBase with _$QrStore;

abstract class _QrStoreBase with Store {
  @observable
  String data = "";

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

  @observable
  QrEyeStyle eyeStyle =
      const QrEyeStyle(color: Colors.black, eyeShape: QrEyeShape.square);

  @observable
  Color foregroundColor = Colors.black;

  @observable
  bool gapless = true;

  @observable
  EdgeInsets padding = EdgeInsets.all(6); // limit

  TextEditingController qrTextEditingController = TextEditingController();
}
