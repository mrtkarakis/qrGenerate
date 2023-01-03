import 'package:flutter/material.dart';
import 'package:qr_generate/core/widget/app_bar.dart';
import 'package:qr_generate/core/widget/qr.dart';
import 'package:qr_generate/core/extension/string_extension.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/page/qrEdit/qr_edit_view.dart';
import 'package:qr_generate/service/image_services.dart';
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
            child:
                Text("Change ${widget.qrDesignType.name.capitalize()} Color")),
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
                children: [
                  Row(
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
                              qrDesignServices.typeColor(widget.qrDesignType);
                          bool isSelectColor = (color == selectedColor);

                          return ElevatedButton(
                            onPressed: () => setState(() => qrDesignServices
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
    Color color =
        qrDesignServices.typeColor(changeQrDesignType) ?? Colors.black;
    color = color == Colors.white ? Colors.grey.shade300 : color;
    return TextButton(
      onPressed: () {
        setState(() {
          widget.qrDesignType = changeQrDesignType;
        });
      },
      style: TextButton.styleFrom(
          foregroundColor: color,
          backgroundColor: color.withOpacity(.6),
          minimumSize: Size(deviceStore.size.width / 3, 55),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                changeQrDesignType == QrDesignType.dots ? 18 : 0),
            topRight: Radius.circular(
                changeQrDesignType == QrDesignType.background ? 18 : 0),
          ))),
      child: Text(
        changeQrDesignType.name.capitalize(),
        style: TextStyle(
          color: changeQrDesignType == widget.qrDesignType
              ? Colors.black
              : Colors.black54,
          fontSize: 15,
        ),
      ),
    );
  }
}
