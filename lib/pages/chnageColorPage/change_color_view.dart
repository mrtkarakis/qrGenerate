import 'package:flutter/material.dart';
import 'package:qr_generate/core/widgets/qr.dart';
import 'package:qr_generate/extension/string_extension.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/pages/qrEditPage/qr_edit_view.dart';
import 'package:qr_generate/services/image_services.dart';
import 'package:qr_generate/styles/color_palatte.dart';

class ChangeColorPage extends StatefulWidget {
  ChangeColorPage({
    Key? key,
    required this.qrDesignType,
  }) : super(key: key);
  QrDesignType qrDesignType;

  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        padding: EdgeInsets.only(
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
                          Color color = ColorPalatte.values[index].color();
                          Color? selectedColor;

                          selectedColor =
                              qrDesignServices.typeColor(widget.qrDesignType);
                          bool isSelectColor = (color == selectedColor);

                          return ElevatedButton(
                            onPressed: () => setState(() => qrDesignServices
                                .changeColor(widget.qrDesignType, color)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                primary: color,
                                shape: const CircleBorder()),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: isSelectColor
                                  ? Image.asset(
                                      AssetsIcons.selected.fullPath(),
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
          primary: color,
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
                ? Colors.black87
                : Colors.black54),
      ),
    );
  }
}
