import 'package:flutter/material.dart';
import 'package:qr_generate/core/widget/app_bar.dart';
import 'package:qr_generate/core/widget/qr.dart';
import 'package:qr_generate/core/extension/string_extension.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/page/qrEdit/qr_edit_view.dart';
import 'package:qr_generate/service/image/image_service.dart';
import 'package:qr_generate/core/theme/color_palatte.dart';

// ignore: must_be_immutable
class ChangeColorPage extends StatefulWidget {
  ChangeColorPage({
    super.key,
    required this.qrDesignType,
  });
  QrDesignType qrDesignType;

  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: FittedBox(
            child: Text("Change ${widget.qrDesignType.name.capitalize} Color")),
      ),
      body: Column(
        children: [
          const SizedBox(height: 18),
          const Center(child: Qr()),
          const SizedBox(height: 18),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      switchTypeButton(QrDesignType.dots),
                      switchTypeButton(QrDesignType.eye),
                      switchTypeButton(QrDesignType.background),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.only(
                            top: 8, left: 18, right: 18, bottom: 38),
                        shrinkWrap: true,
                        itemCount: ColorPalatte.values.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          Color color = ColorPalatte.values[index].color;
                          Color? selectedColor;

                          selectedColor =
                              qrDesignService.typeColor(widget.qrDesignType);
                          bool isSelectColor = (color == selectedColor);

                          return ElevatedButton(
                            onPressed: () => setState(() => qrDesignService
                                .changeColor(widget.qrDesignType, color)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: color,
                                shape: const CircleBorder()),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: isSelectColor
                                  ? Image.asset(
                                      AssetsIcons.selected.fullPath,
                                      height: 35,
                                    )
                                  : const SizedBox(),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton switchTypeButton(QrDesignType changeQrDesignType) {
    const TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 15);

    final bool isSelect = widget.qrDesignType == changeQrDesignType;
    final Color color =
        qrDesignService.typeColor(changeQrDesignType) ?? Colors.black;
    final bool isDots = changeQrDesignType == QrDesignType.dots;
    final bool isBackground = changeQrDesignType == QrDesignType.background;
    const double borderRadiusSize = 18;
    final Size size = Size(deviceStore.size.width / 3, !isSelect ? 56 : 67);
    final String text = changeQrDesignType.name.capitalize;
    return TextButton(
      key: ValueKey(changeQrDesignType.title),
      onPressed: () => Future.microtask(
        () => setState(() => widget.qrDesignType = changeQrDesignType),
      ),
      style: TextButton.styleFrom(
        foregroundColor: color,
        backgroundColor: color.withOpacity(.72),
        fixedSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isDots ? borderRadiusSize : 0),
            topRight: Radius.circular(isBackground ? borderRadiusSize : 0),
            bottomLeft: Radius.circular(!isDots ? borderRadiusSize / 2 : 0),
            bottomRight:
                Radius.circular(!isBackground ? borderRadiusSize / 2 : 0),
          ),
        ),
      ),
      child: Text(text, style: textStyle),
    );
  }
}
