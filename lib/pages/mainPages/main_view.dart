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
              QrData(),
            ],
          ),
        ),
      ),
    );
  }
}










// class QRCodePlayground extends StatefulWidget {
//   const QRCodePlayground({Key? key}) : super(key: key);
//   @override
//   _QRCodePlaygroundState createState() => _QRCodePlaygroundState();
// }
// class _QRCodePlaygroundState extends State<QRCodePlayground> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: ListView(
//         children: [
//           qrStore.qrTextEditingController.text.isEmpty
//               ? const SizedBox.shrink()
//               : Screenshot(
//                   controller: screenshotController,
//                   child: Container(
//                       padding: EdgeInsets.all(18),
//                       color: Colors.white,
//                       child:
//                           QrImage(data: qrStore.qrTextEditingController.text))),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: qrStore.qrTextEditingController,
//             maxLines: 12,
//             minLines: 1,
//             textInputAction: TextInputAction.newline,
//             // decoration: InputDecoration(
//             //     border: OutlineInputBorder(
//             //         borderSide: BorderSide(color: Colors.blue))),
//           ),
//           SizedBox(height: 20),
//           RaisedButton(
//             color: Colors.blue,
//             textColor: Colors.white,
//             child: Text('Generate QR Code'),
//             onPressed: () => setState(() {}),
//             padding: EdgeInsets.symmetric(vertical: 12),
//           ),
//           CopyTextWidget(),
//           RaisedButton(
//             onPressed: () async {
//               if (qrStore.qrTextEditingController.text.isEmpty) {
//                 Scaffold.of(context).showSnackBar(
//                     SnackBar(content: Text('Generate your QR code first')));
//               } else {
//                 await _shareQrCode();
//               }
//             },
//             color: Colors.blue,
//             textColor: Colors.white,
//             child: Text('Share QR code'),
//             padding: EdgeInsets.symmetric(vertical: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }
