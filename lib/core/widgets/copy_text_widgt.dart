import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';

class CopyTextWidget extends StatelessWidget {
  const CopyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async =>
          qrStore.data = await textService.getCopyText() ?? "",
      child: Text(mainPageTexts.useCopiedText),
    );
  }
}
