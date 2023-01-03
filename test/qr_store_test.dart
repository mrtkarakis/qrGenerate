import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generate/global.dart';

void main() {
  group(
    "GROUP CHECK Set QR Data =>",
    () {
      test(
        'Check => QR data should change',
        () {
          // Arrange
          const String newData = "Mekonyum";

          // Act
          final String result = qrStore.setQrData(newData);

          // Assert
          expect(result, newData);
        },
      );

      test(
        'Check => QR data should not change (newData = null)',
        () {
          // Arrange
          final String data = qrStore.data;
          const String? newData = null;

          // Act
          final String result = qrStore.setQrData(newData);

          // Assert
          expect(result, data);
        },
      );

      test(
        'Check => QR data should not change (newData = "")',
        () {
          // Arrange
          final String data = qrStore.data;
          const String newData = "";

          // Act
          final String result = qrStore.setQrData(newData);

          // Assert
          expect(result, data);
        },
      );
    },
  );
}
