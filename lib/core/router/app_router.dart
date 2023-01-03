import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:qr_generate/page/changeColor/change_color_view.dart';
import 'package:qr_generate/page/main/main_view.dart';
import 'package:qr_generate/page/qrEdit/qr_edit_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: "homePage", initial: true),
    AutoRoute(page: QrEditPage, path: "qrEditPage"),
    AutoRoute(page: ChangeColorPage, path: "changeColorPage"),
  ],
)
class AppRouter extends _$AppRouter {}
