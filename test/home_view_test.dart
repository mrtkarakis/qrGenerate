import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generate/core/localization/texts.dart';
import 'package:qr_generate/core/widget/gradient_elevated_button.dart';
import 'package:qr_generate/core/widget/qr_form_widget.dart';
import 'package:qr_generate/page/home/home_view.dart';

void main() {
  group("Qr Generate Page", () {
    testWidgets('Should have a QR Form Field', (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      // ACT
      final Finder field = find.byType(QrFormField);

      // Assert
      expect(field, findsOneWidget);
    });

    testWidgets('Should have a Generate Qr Button',
        (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      // ACT
      final Finder generateButton = find.widgetWithText(
          GradientElevatedButton, AppTexts.generateQrButton);

      // Assert
      expect(generateButton, findsOneWidget);
    });
  });
}
