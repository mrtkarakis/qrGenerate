import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/core/localization/texts.dart';
import 'package:qr_generate/core/theme/color_palatte.dart';

import 'gradient_elevated_button.dart';

class QrFormField extends StatelessWidget {
  const QrFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: QrFormFieldStyle.qrFormPadding,
      decoration: BoxDecoration(
        color: QrFormFieldStyle.bgColor,
        borderRadius: uiStyle.borderRadius20,
      ),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            style: QrFormFieldStyle.style,
            cursorWidth: QrFormFieldStyle.cursorWidth,
            cursorRadius: QrFormFieldStyle.cursorRadius,
            cursorColor: QrFormFieldStyle.cursorColor,
            controller: qrStore.qrTextEditingController,
            maxLines: QrFormFieldStyle.formFieldMaxLines,
            minLines: QrFormFieldStyle.formFieldMinLines,
            // decoration: QrFormFieldStyle.formDecoration,
          ),
        ),
        Padding(
          padding: QrFormFieldStyle.buttonPadding,
          child: GradientElevatedButton(
            onPressed: () =>
                qrStore.setQrData(qrStore.qrTextEditingController.text),
            // style: QrFormFieldStyle.generateButtonStyle,
            child: const FittedBox(
                child: Text(
              AppTexts.generateQrButton,
              textAlign: TextAlign.center,
              maxLines: QrFormFieldStyle.buttonMaxLines,
            )),
          ),
        ),
      ]),
    );
  }
}

class QrFormFieldStyle {
  static const int formFieldMaxLines = 8;
  static const int formFieldMinLines = 1;
  static final Color bgColor = Colors.grey.shade300;
  static const EdgeInsets qrFormPadding = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(vertical: 2.5);

  static const Radius cursorRadius = Radius.circular(20);
  static const double cursorWidth = 2;
  static final TextStyle style =
      TextStyle(color: ColorPalatte.darkSlateBlue.color);
  static final Color cursorColor = ColorPalatte.seaGreen.color;
  static final ButtonStyle generateButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    fixedSize: const Size(70, 55),
  );
  static const int buttonMaxLines = 2;
}
