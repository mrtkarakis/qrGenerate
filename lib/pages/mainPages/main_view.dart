import 'package:flutter/material.dart';
import 'package:qr_generate/core/widgets/copy_text_widgt.dart';
import 'package:qr_generate/core/widgets/main_view_qr.dart';
import 'package:qr_generate/core/widgets/qr_data.dart';
import 'package:qr_generate/core/widgets/qr_form_widget.dart';
import 'package:qr_generate/global.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const SizedBox paddingWidget = SizedBox(height: 12);
  @override
  Widget build(BuildContext context) {
    deviceStore.setSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(mainPageTexts.appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: uiStyle.screenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              paddingWidget,
              MainViewQr(),
              paddingWidget,
              QrFormField(),
              paddingWidget,
              CopyTextWidget(),
              paddingWidget,
              // QrData(),
            ],
          ),
        ),
      ),
    );
  }
}
