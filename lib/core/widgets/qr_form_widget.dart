import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';

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
        borderRadius: uiStyle.borderRadius12,
      ),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            controller: qrStore.qrTextEditingController,
            maxLines: QrFormFieldStyle.formFieldMaxLines,
            minLines: QrFormFieldStyle.formFieldMinLines,
            decoration: QrFormFieldStyle.formDecoration,
          ),
        ),
        Padding(
          padding: QrFormFieldStyle.buttonPadding,
          child: ElevatedButton(
            onPressed: () =>
                qrStore.data = qrStore.qrTextEditingController.text,
            style: QrFormFieldStyle.generateButtonStyle,
            child: FittedBox(
                child: Text(
              mainPageTexts.generateQrButton,
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
  static const InputDecoration formDecoration = InputDecoration(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );

  static final ButtonStyle generateButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    fixedSize: const Size(70, 55),
  );
  static const int buttonMaxLines = 2;
}
