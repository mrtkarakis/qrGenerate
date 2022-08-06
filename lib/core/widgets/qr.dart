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
          padding: qrStore.padding,
          constrainErrorBounds: false,
          embeddedImageEmitsError: false,
          errorCorrectionLevel: 1,
        ),
      );
    });
  }
}
