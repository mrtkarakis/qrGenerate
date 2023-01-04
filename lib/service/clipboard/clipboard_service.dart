import 'package:flutter/services.dart';

class ClipboardService {
  static ClipboardService? _instance;
  static ClipboardService get instance {
    if (_instance != null) return _instance!;
    _instance = ClipboardService._init();
    return _instance!;
  }

  ClipboardService._init();

  Future<bool> hasClipboardData() async {
    final bool hasCopyText = await Clipboard.hasStrings();
    return hasCopyText;
  }

  Future<String?> getCopyText() async {
    String? result;
    final bool hasCopyText = await hasClipboardData();

    if (hasCopyText) {
      final ClipboardData? copyText = await Clipboard.getData('text/plain');
      result = copyText?.text?.trim();
    }
    return result;
  }

  String? copyText(String data) {
    if (data.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: data));
      return data;
    }
    return null;
  }
}
