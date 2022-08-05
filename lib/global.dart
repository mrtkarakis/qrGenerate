library store.store;

import 'package:qr_generate/core/texts/texts.dart';
import 'package:qr_generate/services/textServices/text_service.dart';
import 'package:qr_generate/services/widget_services.dart';
import 'package:qr_generate/store/qrStore/qr_store.dart';
import 'package:qr_generate/styles/ui_style.dart';

import 'store/deviceStore/device_store.dart';

//store
final DeviceStore deviceStore = DeviceStore();
final QrStore qrStore = QrStore();

//style
final UiStyle uiStyle = UiStyle();

//service
final TextService textService = TextService();
final WidgetServices widgetServices = WidgetServices();

//text
final MainPageTexts mainPageTexts = MainPageTexts();
