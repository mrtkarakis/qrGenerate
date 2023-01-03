import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';

class WidgetServices {
  Size? getSizes(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    final Size? size = renderBox?.size;
    log("DeviceSize: ${deviceStore.size}, Size: $size ",
        name: "WidgetServices.getPositions");
    return size;
  }

  Offset? getPositions(GlobalKey key) {
    final RenderBox? renderBoxRed =
        key.currentContext?.findRenderObject() as RenderBox?;
    final Offset? position = renderBoxRed?.localToGlobal(Offset.zero);
    log("DeviceSize: ${deviceStore.size}, Position: $position",
        name: "WidgetServices.getPositions");
    return position;
  }
}
