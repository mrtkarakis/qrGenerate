import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate/core/widgets/qr.dart';
import 'package:qr_generate/global.dart';

import 'widgets/qr_design_switch.dart';

class QrEditPage extends StatelessWidget {
  const QrEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr Edit"),
      ),
      body: SizedBox(
        width: deviceStore.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(child: Qr()),
            SizedBox(
              height:
                  deviceStore.size.height - (deviceStore.size.width / 2) - 126,
              child: Stack(
                alignment: Alignment.topCenter,
                children: const [
                  Positioned(
                      top: 90,
                      child: QrDesignSwitch(qrDesignType: QrDesignType.eye)),
                  Positioned(
                      top: 0,
                      child: QrDesignSwitch(qrDesignType: QrDesignType.dots)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
