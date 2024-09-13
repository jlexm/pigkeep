import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  MobileScannerController camcontroller =
      MobileScannerController(facing: CameraFacing.back);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Scanner',
          style: TextStyle(
            color: appSecondary,
            fontSize: 18.r,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: appPrimary,
      ),
      body: MobileScanner(
        controller: camcontroller,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final String? code = barcode.rawValue;
            if (code != null) {
              // Show a snackbar with the scanned QR code data
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Scanned Code: $code')),
              );
              // Optionally, you can stop scanning after the first successful scan
              camcontroller.stop();
              break; // Stop after the first successful scan
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          camcontroller.toggleTorch(); // Toggle the flashlight
        },
        backgroundColor: appPrimary,
        child: Icon(
          Icons.flash_on,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    camcontroller.dispose();
    super.dispose();
  }
}
