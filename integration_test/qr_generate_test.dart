import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:qr_generate/core/localization/texts.dart';
import 'package:qr_generate/core/widget/gradient_elevated_button.dart';
import 'package:qr_generate/core/widget/qr_form_widget.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/page/home/home_view.dart';

void main() {
  group("Qr Generate Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("data and qrData must be the not same",
        (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      // ACT
      const String qrData = "";
      final Finder field = find.byType(QrFormField);
      final Finder generateButton = find.widgetWithText(
          GradientElevatedButton, AppTexts.generateQrButton);
      await tester.enterText(field, qrData);
      await tester.tap(generateButton);

      String data = qrStore.data;
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //ASSERT
      expect(data, data);
    });

    testWidgets("data and qrData must be the same",
        (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      // ACT
      const String qrData = "Integration Test";
      final Finder field = find.byType(QrFormField);
      final Finder generateButton = find.widgetWithText(
          GradientElevatedButton, AppTexts.generateQrButton);
      await tester.enterText(field, qrData);
      await tester.pumpAndSettle(const Duration(milliseconds: 200));

      await tester.tap(generateButton);

      String data = qrStore.data;
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //ASSERT
      expect(data, qrData);
    });
  });
}
