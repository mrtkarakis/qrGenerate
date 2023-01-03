library store.store;

import 'package:qr_generate/service/qr_design_services.dart';
import 'package:qr_generate/service/text_service.dart';
import 'package:qr_generate/service/widget_services.dart';
import 'package:qr_generate/store/qrStore/qr_store.dart';
import 'package:qr_generate/core/theme/ui_style.dart';

import 'store/deviceStore/device_store.dart';

//store
final DeviceStore deviceStore = DeviceStore();
final QrStore qrStore = QrStore();

//style
final UiStyle uiStyle = UiStyle();

//service
final ClipboardService clipboardService = ClipboardService();
final WidgetServices widgetServices = WidgetServices();
final QrDesignServices qrDesignServices = QrDesignServices();
