library store.store;

import 'package:qr_generate/service/clipboard/clipboard_service.dart';
import 'package:qr_generate/service/developer/developer_service.dart';
import 'package:qr_generate/service/qr/qr_design_service.dart';
import 'package:qr_generate/service/toastMessage/toast_message_service.dart';
import 'package:qr_generate/service/widget/widget_service.dart';
import 'package:qr_generate/store/qrStore/qr_store.dart';
import 'package:qr_generate/core/theme/ui_style.dart';

import 'store/deviceStore/device_store.dart';

//store
final DeviceStore deviceStore = DeviceStore();
final QrStore qrStore = QrStore();

//style
final UiStyle uiStyle = UiStyle();

//service
final ClipboardService clipboardService = ClipboardService.instance;
final WidgetService widgetService = WidgetService.instance;
final QrDesignService qrDesignService = QrDesignService.instance;
final ToastMessageService toastMessageService = ToastMessageService.instance;
final DeveloperService developerService = DeveloperService.instance;
