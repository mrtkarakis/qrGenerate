import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_generate/global.dart';

class QrData extends StatelessWidget {
  const QrData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;
    return Observer(builder: (_) {
      final String data = qrStore.data;
      return Text(
        data,
        style: textStyle,
      );
    });
  }
}
