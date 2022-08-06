import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate/global.dart';

class Qr extends StatelessWidget {
  const Qr({
    Key? key,
  }) : super(key: key);
  static final double qrImageSize = deviceStore.size.width / 2;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      // final String data = qrStore.data;
      // final Object tag = data;
      // final Key qrKey = Key(data);
      // final Color backgroundColor = qrStore.backgroundColor;
      // final QrDataModuleStyle dataModuleStyle = qrStore.dataModuleStyle;
      // final QrEyeStyle eyeStyle = qrStore.eyeStyle;
      // final Color foregroundColor = qrStore.foregroundColor;
      // final bool gapless = qrStore.gapless;
      // final EdgeInsets padding = qrStore.padding;
      // const bool constrainErrorBounds = false;
      // const bool embeddedImageEmitsError = false;
      // const int errorCorrectionLevel = 1;
      return Hero(
        tag: qrStore.data,
        key: Key(qrStore.data),
        child: QrImage(
          key: Key(qrStore.data),
          data: qrStore.data,
          version: QrVersions.auto,
          size: qrImageSize,
          backgroundColor: qrStore.backgroundColor,
          dataModuleStyle: qrStore.dataModuleStyle,
          eyeStyle: qrStore.eyeStyle,
          foregroundColor: qrStore.foregroundColor,
          gapless: qrStore.gapless,
          padding: qrStore.padding, // limit 20
          constrainErrorBounds: false,
          embeddedImageEmitsError: false,
          errorCorrectionLevel: 1,
        ),
      );
    });
  }
}
