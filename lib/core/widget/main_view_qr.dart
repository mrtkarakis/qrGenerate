import 'dart:developer' as developer;
import 'dart:io' as io;
import 'dart:typed_data' as typeddata;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate/core/router/app_router.dart';
import 'package:qr_generate/core/widget/qr.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/service/image/image_service.dart';
import 'package:qr_generate/core/theme/color_palatte.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class MainViewQr extends StatelessWidget {
  const MainViewQr({
    Key? key,
  }) : super(key: key);
  static final ScreenshotController screenshotController =
      ScreenshotController();
  static final GlobalKey colorLensKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) {
          return qrStore.data.isEmpty
              ? const SizedBox()
              : SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: deviceStore.size.width / 2,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        leftPanel(context),
                        const SizedBox(width: 5),
                        Center(
                          child: Screenshot(
                            controller: screenshotController,
                            child: const Qr(),
                          ),
                        ),
                        const SizedBox(width: 5),
                        rightPanel(),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Flexible rightPanel() {
    return Flexible(
      flex: 1,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            qrPanelButton(
              color: ColorPalatte.darkSeaGreen.color,
              iconPath: AssetsIcons.share.fullPath,
              onPressed: () async {
                await const MainViewQr().shareQrCode();
              },
              toolTipMessage: "Share",
            ),
            const Spacer(),
            qrPanelButton(
              color: ColorPalatte.lightSteelPink.color,
              toolTipMessage: "Copy Data",
              iconPath: AssetsIcons.copy.fullPath,
              onPressed: () {
                String data = qrStore.data;
                clipboardService.copyText(data);
                toastMessageService.toastMessage("Data copied");
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Flexible leftPanel(BuildContext context) {
    return Flexible(
        flex: 1,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              qrPanelButton(
                color: ColorPalatte.lightSteelBlue.color,
                toolTipMessage: "Edit",
                iconPath: AssetsIcons.edit.fullPath,
                onPressed: () => context.router.push(const QrEditRoute()),
              ),
              const Spacer(),
              Observer(
                builder: (_) {
                  return qrPanelButton(
                    color: qrStore.backgroundColor,
                    toolTipMessage: "Change Background Color",
                    globalKey: colorLensKey,
                    iconPath: AssetsIcons.colorPalatte.fullPath,
                    onPressed: () {
                      final colorLensPosition =
                          widgetService.getPositions(colorLensKey);
                      final colorLensSize =
                          widgetService.getSizes(colorLensKey);
                      showDialog(
                          context: context,
                          useSafeArea: false,
                          builder: (_) {
                            return colorLensPosition != null
                                ? ColorLensWidget(
                                    colorLensPosition: colorLensPosition,
                                    colorLensSize: colorLensSize!,
                                  )
                                : const SizedBox();
                          });
                    },
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ));
  }

  SafeArea qrPanelButton(
      {required String iconPath,
      required String toolTipMessage,
      Size size = const Size(55, 55),
      VoidCallback? onPressed,
      Color? color,
      GlobalKey? globalKey}) {
    return SafeArea(
      child: Tooltip(
        message: toolTipMessage,
        textAlign: TextAlign.center,
        verticalOffset: -size.height - 6.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: uiStyle.borderRadius12,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
            ),
          ],
        ),
        child: ElevatedButton(
          key: globalKey,
          style: ElevatedButton.styleFrom(
            fixedSize: size,
            shape: const CircleBorder(),
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconPath),
              ),
            ),
          ),
        ),
      ),
    );
  }

  shareQrCode() async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    screenshotController.capture().then((typeddata.Uint8List? image) async {
      if (image != null) {
        try {
          String fileName = DateTime.now().microsecondsSinceEpoch.toString();
          final io.File imagePath =
              await io.File('$directory/$fileName.png').create();
          await imagePath.writeAsBytes(image);
          Share.shareFiles([imagePath.path]);
        } catch (error) {
          developer.log('Error --->> $error');
        }
      }
    }).catchError((onError) {
      developer.log('Error --->> $onError');
    });
  }
}

class ColorLensWidget extends StatelessWidget {
  const ColorLensWidget({
    Key? key,
    required this.colorLensPosition,
    required this.colorLensSize,
  }) : super(key: key);

  final Offset colorLensPosition;
  final Size colorLensSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: colorLensPosition.dy - MediaQuery.of(context).viewPadding.top,
          left: colorLensPosition.dx,
          child: SafeArea(
            child: Column(
              children: [
                colorButton(context, color: qrStore.backgroundColor),
                colorButton(context, color: ColorPalatte.values[40].color),
                colorButton(context, color: ColorPalatte.values[9].color),
                colorButton(context, color: ColorPalatte.values[12].color),
                colorButton(context, color: ColorPalatte.values[32].color),
                colorButton(context, color: ColorPalatte.values[23].color),
                colorButton(context, color: ColorPalatte.values[44].color),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding colorButton(
    BuildContext context, {
    Color color = Colors.white,
    double size = 55,
    double bottomPadding = 8,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: ElevatedButton(
        onPressed: () {
          qrStore.setBackgroundColor(color);
          context.router.pop();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          foregroundColor: color,
          fixedSize: Size(size, size),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            color: color,
          ),
          height: size,
          child: QrImage(
            data: "meko",
          ),
        ),
      ),
    );
  }
}
