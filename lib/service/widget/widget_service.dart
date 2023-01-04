import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';

class WidgetService {
  static WidgetService? _instance;
  static WidgetService get instance {
    if (_instance != null) return _instance!;
    _instance = WidgetService._init();
    return _instance!;
  }

  WidgetService._init();

  Size? getSizes(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    final Size? size = renderBox?.size;

    developerService.developerLog(
        "DeviceSize: ${deviceStore.size}, Size: $size ",
        name: "WidgetService.getPositions");
    return size;
  }

  Offset? getPositions(GlobalKey key) {
    final RenderBox? renderBoxRed =
        key.currentContext?.findRenderObject() as RenderBox?;
    final Offset? position = renderBoxRed?.localToGlobal(Offset.zero);
    developerService.developerLog(
        "DeviceSize: ${deviceStore.size}, Position: $position",
        name: "WidgetService.getPositions");
    return position;
  }
}
