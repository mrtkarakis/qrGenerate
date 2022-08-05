import 'package:flutter/material.dart';

class WidgetServices {
  Size? getSizes(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    final Size? size = renderBox?.size;
    return size;
  }

  Offset? getPositions(GlobalKey key) {
    final RenderBox? renderBoxRed =
        key.currentContext?.findRenderObject() as RenderBox?;
    final Offset? position = renderBoxRed?.localToGlobal(Offset.zero);
    return position;
  }
}
