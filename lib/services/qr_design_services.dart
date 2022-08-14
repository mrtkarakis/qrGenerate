import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/pages/qrEditPage/qr_edit_view.dart';

class QrDesignServices {
  Color changeColor(QrDesignType qrDesignType, Color color) {
    switch (qrDesignType) {
      case QrDesignType.dots:
        qrStore.setDataModuleStyle(color: color);
        break;
      case QrDesignType.eye:
        qrStore.setEyeStyle(color: color);
        break;
      case QrDesignType.background:
        qrStore.setBackgroundColor(color);
        break;
      default:
    }
    return color;
  }

  Color? typeColor(QrDesignType qrDesignType) {
    switch (qrDesignType) {
      case QrDesignType.dots:
        return qrStore.dataModuleStyle.color;
      case QrDesignType.eye:
        return qrStore.eyeStyle.color;
      case QrDesignType.background:
        return qrStore.backgroundColor;
      default:
    }
  }
}
