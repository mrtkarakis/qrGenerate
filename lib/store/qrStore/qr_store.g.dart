// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrStore on _QrStoreBase, Store {
  late final _$dataAtom = Atom(name: '_QrStoreBase.data', context: context);

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$backgroundColorAtom =
      Atom(name: '_QrStoreBase.backgroundColor', context: context);

  @override
  Color get backgroundColor {
    _$backgroundColorAtom.reportRead();
    return super.backgroundColor;
  }

  @override
  set backgroundColor(Color value) {
    _$backgroundColorAtom.reportWrite(value, super.backgroundColor, () {
      super.backgroundColor = value;
    });
  }

  late final _$dataModuleStyleAtom =
      Atom(name: '_QrStoreBase.dataModuleStyle', context: context);

  @override
  QrDataModuleStyle get dataModuleStyle {
    _$dataModuleStyleAtom.reportRead();
    return super.dataModuleStyle;
  }

  @override
  set dataModuleStyle(QrDataModuleStyle value) {
    _$dataModuleStyleAtom.reportWrite(value, super.dataModuleStyle, () {
      super.dataModuleStyle = value;
    });
  }

  late final _$eyeStyleAtom =
      Atom(name: '_QrStoreBase.eyeStyle', context: context);

  @override
  QrEyeStyle get eyeStyle {
    _$eyeStyleAtom.reportRead();
    return super.eyeStyle;
  }

  @override
  set eyeStyle(QrEyeStyle value) {
    _$eyeStyleAtom.reportWrite(value, super.eyeStyle, () {
      super.eyeStyle = value;
    });
  }

  late final _$foregroundColorAtom =
      Atom(name: '_QrStoreBase.foregroundColor', context: context);

  @override
  Color? get foregroundColor {
    _$foregroundColorAtom.reportRead();
    return super.foregroundColor;
  }

  @override
  set foregroundColor(Color? value) {
    _$foregroundColorAtom.reportWrite(value, super.foregroundColor, () {
      super.foregroundColor = value;
    });
  }

  late final _$gaplessAtom =
      Atom(name: '_QrStoreBase.gapless', context: context);

  @override
  bool get gapless {
    _$gaplessAtom.reportRead();
    return super.gapless;
  }

  @override
  set gapless(bool value) {
    _$gaplessAtom.reportWrite(value, super.gapless, () {
      super.gapless = value;
    });
  }

  late final _$paddingAtom =
      Atom(name: '_QrStoreBase.padding', context: context);

  @override
  EdgeInsets get padding {
    _$paddingAtom.reportRead();
    return super.padding;
  }

  @override
  set padding(EdgeInsets value) {
    _$paddingAtom.reportWrite(value, super.padding, () {
      super.padding = value;
    });
  }

  late final _$_QrStoreBaseActionController =
      ActionController(name: '_QrStoreBase', context: context);

  @override
  String setQrData(String? text) {
    final _$actionInfo = _$_QrStoreBaseActionController.startAction(
        name: '_QrStoreBase.setQrData');
    try {
      return super.setQrData(text);
    } finally {
      _$_QrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color setBackgroundColor(Color color) {
    final _$actionInfo = _$_QrStoreBaseActionController.startAction(
        name: '_QrStoreBase.setBackgroundColor');
    try {
      return super.setBackgroundColor(color);
    } finally {
      _$_QrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  QrDataModuleStyle setDataModuleStyle(
      {Color? color, QrDataModuleShape? qrDataModuleShape}) {
    final _$actionInfo = _$_QrStoreBaseActionController.startAction(
        name: '_QrStoreBase.setDataModuleStyle');
    try {
      return super.setDataModuleStyle(
          color: color, qrDataModuleShape: qrDataModuleShape);
    } finally {
      _$_QrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  QrEyeStyle setEyeStyle({Color? color, QrEyeShape? eyeShape}) {
    final _$actionInfo = _$_QrStoreBaseActionController.startAction(
        name: '_QrStoreBase.setEyeStyle');
    try {
      return super.setEyeStyle(color: color, eyeShape: eyeShape);
    } finally {
      _$_QrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color setForegroundColor(Color color) {
    final _$actionInfo = _$_QrStoreBaseActionController.startAction(
        name: '_QrStoreBase.setForegroundColor');
    try {
      return super.setForegroundColor(color);
    } finally {
      _$_QrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
backgroundColor: ${backgroundColor},
dataModuleStyle: ${dataModuleStyle},
eyeStyle: ${eyeStyle},
foregroundColor: ${foregroundColor},
gapless: ${gapless},
padding: ${padding}
    ''';
  }
}
