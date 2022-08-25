import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';

import 'gradient_elevated_button.dart';

class CopyTextWidget extends StatelessWidget {
  const CopyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientElevatedButton(
      onPressed: () async =>
          qrStore.data = await textService.getCopyText() ?? "",
      child: Text(mainPageTexts.useCopiedText),
    );
  }
}
