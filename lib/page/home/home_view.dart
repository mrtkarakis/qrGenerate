import 'package:flutter/material.dart';
import 'package:qr_generate/core/widget/app_bar.dart';
import 'package:qr_generate/core/widget/copy_text_widgt.dart';
import 'package:qr_generate/core/widget/main_view_qr.dart';
import 'package:qr_generate/core/widget/qr_form_widget.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/core/localization/texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const SizedBox paddingWidget = SizedBox(height: 12);
  @override
  Widget build(BuildContext context) {
    deviceStore.setSize(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(AppTexts.appBarTitle),
        backButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                CopyTextWidget(),
                paddingWidget,
                QrFormField(),
                paddingWidget,
                // QrData(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
