import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/page/qrEdit/qr_edit_view.dart';

class QrDesignService {
  static QrDesignService? _instance;
  static QrDesignService get instance {
    if (_instance != null) return _instance!;
    _instance = QrDesignService._init();
    return _instance!;
  }

  QrDesignService._init();

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
    Color? color;
    switch (qrDesignType) {
      case QrDesignType.dots:
        color = qrStore.dataModuleStyle.color;
        break;
      case QrDesignType.eye:
        color = qrStore.eyeStyle.color;
        break;
      case QrDesignType.background:
        color = qrStore.backgroundColor;
        break;
      default:
    }
    return color;
  }
}
