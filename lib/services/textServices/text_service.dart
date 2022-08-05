import 'package:flutter/services.dart';
import 'package:qr_generate/global.dart';

class TextService {
  Future<String?> getCopyText() async {
    String? result;
    bool hasCopyText = await Clipboard.hasStrings();
    if (hasCopyText) {
      ClipboardData? copyText = await Clipboard.getData('text/plain');
      result = copyText!.text!.trim();
    }
    return result;
  }
  // void copyText() async {
  //   String? result;
  //   bool hasCopyText = await Clipboard.hasStrings();
  //   if (hasCopyText) {
  //             Clipboard.setData( ClipboardData(text: qrStore.data.trim()));

  //     result = copyText!.text!.trim();
  //   }
  //   return result;
  // }

  void copyText(String data) {
    if (data.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: data));
    }
  }
}
