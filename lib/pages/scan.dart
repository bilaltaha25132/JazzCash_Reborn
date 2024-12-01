import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (barcodeCapture) {
              final barcode = barcodeCapture.barcodes.first;
              final String? rawValue = barcode.rawValue;

              if (rawValue != null) {
                // Navigate to the display page with QR code data
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QrCodeResultPage(qrData: rawValue),
                  ),
                );
              }
            },
          ),
          Positioned.fill(
              child: CustomPaint(
                painter: BorderPainter(),
              ),
          ),
        ]
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF800000)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final borderWidth = size.width * 0.8; // 80% of the screen width
    final borderHeight = size.height * 0.4; // 40% of the screen height
    final horizontalOffset = (size.width - borderWidth) / 2; // Center horizontally
    final verticalOffset = (size.height - borderHeight) / 2; // Center vertically

    final rect = Rect.fromLTWH(
      horizontalOffset,
      verticalOffset,
      borderWidth,
      borderHeight,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(16)), // Rounded corners
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class QrCodeResultPage extends StatelessWidget {
  final String qrData;

  const QrCodeResultPage({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("QR Code Result"),
        backgroundColor: const Color(0xFF800000),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_2, size: 100, color: Color(0xFF800000)),
            const SizedBox(height: 20),
            const Text(
              "QR Code Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              qrData,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Return to the scanner page
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                backgroundColor: const Color(0xFF800000),
              ),
              child: const Text("Scan Another QR Code", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
