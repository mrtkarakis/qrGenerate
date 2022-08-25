import 'package:flutter/material.dart';
import 'package:qr_generate/core/widgets/app_bar.dart';
import 'package:qr_generate/core/widgets/qr.dart';
import 'package:qr_generate/global.dart';

import 'widgets/qr_design_switch.dart';

class QrEditPage extends StatelessWidget {
  const QrEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Qr Edit"),
      ),
      body: SizedBox(
        width: deviceStore.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(child: Qr()),
            const SizedBox(height: 12),
            Padding(
              padding: uiStyle.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  QrDesign(qrDesignType: QrDesignType.dots),
                  SizedBox(height: 12),
                  QrDesign(qrDesignType: QrDesignType.eye),
                  SizedBox(height: 12),
                  QrDesign(qrDesignType: QrDesignType.background),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum QrDesignType {
  dots("dots"),
  eye("eyes"),
  background("background color");

  final String title;
  const QrDesignType(this.title);
}
