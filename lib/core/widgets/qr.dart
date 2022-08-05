import 'dart:io' as io;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/pages/qrEditPage/qr_edit_view.dart';
import 'package:qr_generate/styles/color_palatte.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class Qr extends StatelessWidget {
  const Qr({
    Key? key,
  }) : super(key: key);
  static ScreenshotController screenshotController = ScreenshotController();
  static GlobalKey colorLensKey = GlobalKey();
  static Size? colorLensSize;
  static Offset? colorLensPosition;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return qrStore.data.isEmpty
            ? const SizedBox()
            : SizedBox(
                width: double.infinity,
                height: QrStyle.qrImageSize,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              qrPanelButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const QrEditPage()));
                                },
                              ),
                              const Spacer(),
                              Observer(
                                builder: (_) {
                                  return qrPanelButton(
                                    color: qrStore.backgroundColor,
                                    key: colorLensKey,
                                    icon: const Icon(Icons.color_lens),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return colorLensPosition != null
                                                ? ColorLensWidget(
                                                    colorLensPosition:
                                                        colorLensPosition!,
                                                    colorLensSize:
                                                        colorLensSize!,
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
                        )),
                    const SizedBox(width: 5),
                    Observer(builder: (_) {
                      return Flexible(
                        flex: 2,
                        child: Screenshot(
                          controller: screenshotController,
                          child: QrImage(
                            data: qrStore.data,
                            version: QrVersions.auto,
                            size: QrStyle.qrImageSize,
                            backgroundColor: qrStore.backgroundColor,
                            dataModuleStyle: qrStore.dataModuleStyle,
                            eyeStyle: qrStore.eyeStyle,
                            foregroundColor: qrStore.foregroundColor,
                            gapless: qrStore.gapless,
                            padding: qrStore.padding,
                            key: Key(qrStore.data),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(width: 5),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Spacer(),
                            qrPanelButton(
                              icon: const Icon(Icons.ios_share_rounded),
                              onPressed: () async {
                                await const Qr().shareQrCode();
                              },
                            ),
                            const Spacer(),
                            qrPanelButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                String data = qrStore.data;
                                textService.copyText(data);
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  ElevatedButton qrPanelButton(
      {Icon icon = const Icon(Icons.edit),
      Size size = const Size(50, 50),
      VoidCallback? onPressed,
      Color? color,
      GlobalKey? key}) {
    if (key != null) {
      colorLensPosition = widgetServices.getPositions(key);
      print(colorLensPosition);
      colorLensSize = widgetServices.getSizes(key);
      print(colorLensSize);
    }
    return ElevatedButton(
      key: key,
      style: ElevatedButton.styleFrom(
          minimumSize: size, shape: const CircleBorder(), primary: color),
      onPressed: onPressed,
      child: icon,
    );
  }

  shareQrCode() async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        try {
          String fileName = DateTime.now().microsecondsSinceEpoch.toString();
          final imagePath = await io.File('$directory/$fileName.png').create();
          if (imagePath != null) {
            await imagePath.writeAsBytes(image);
            Share.shareFiles([imagePath.path]);
          }
        } catch (error) {}
      }
    }).catchError((onError) {
      print('Error --->> $onError');
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
          top: colorLensPosition.dy - colorLensSize.height,
          left: colorLensPosition.dx - 4,
          child: Column(
            children: [
              colorButton(context, color: qrStore.backgroundColor),
              colorButton(context, color: ColorPalatte.values[40].color()),
              colorButton(context, color: ColorPalatte.values[9].color()),
              colorButton(context, color: ColorPalatte.values[12].color()),
              colorButton(context, color: ColorPalatte.values[32].color()),
              colorButton(context, color: ColorPalatte.values[23].color()),
              colorButton(context, color: ColorPalatte.values[44].color()),
            ],
          ),
        ),
      ],
    );
  }

  Padding colorButton(
    BuildContext context, {
    Color color = Colors.white,
    double size = 52,
    double bottomPadding = 8,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: ElevatedButton(
        onPressed: () {
          qrStore.setBackgroundColor(color);
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          primary: color,
          // minimumSize: Size(55, 55),
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

class QrStyle {
  static final double qrImageSize = deviceStore.size.width / 2;
}
