import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generate/store/qrStore/qr_store.dart';

void main() {
  final QrStore qrStore1 = QrStore();

  group(
    "GROUP CHECK Set QR Data =>",
    () {
      test(
        'Check => QR data should change',
        () {
          // Arrange
          const String newData = "Mekonyum";

          // Act
          String result = qrStore1.setQrData(newData);

          // Assert
          expect(result, newData);
        },
      );

      test(
        'Check => QR data should not change (newData = null)',
        () {
          // Arrange
          final String data = qrStore1.data;
          const String? newData = null;

          // Act
          var result = qrStore1.setQrData(newData);

          // Assert
          expect(result, data);
        },
      );

      test(
        'Check => QR data should not change (newData = "")',
        () {
          // Arrange
          final String data = qrStore1.data;
          const String newData = "";

          // Act
          var result = qrStore1.setQrData(newData);

          // Assert
          expect(result, data);
        },
      );
    },
  );
}
