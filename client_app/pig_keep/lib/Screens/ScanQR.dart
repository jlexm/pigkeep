import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  MobileScannerController camcontroller =
      MobileScannerController(facing: CameraFacing.back);

  final pigService = globalLocator.get<PigService>();

  var selectedFarm;
  late String userOwner;

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      selectedFarm = context.read<GlobalProvider>().getSelectedFarm();
      userOwner = user['username'];
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final farm = context.watch<GlobalProvider>().getSelectedFarm();
    setState(() {
      selectedFarm = farm;
    });
  }

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
        onDetect: (capture) async {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final String? code = barcode.rawValue;
            if (code != null) {
              // Show a snackbar with the scanned QR code data
              /*  ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Scanned Code: $code')),
              ); */
              List<String> qrParts = code.split(':');
              if (qrParts.length == 3) {
                String uuid = qrParts[2];
                var existingPig = await pigService.fetchPigByUuid(uuid, selectedFarm['_id']);
                if(existingPig != null) {
                  context.replace('/records/pigs/${uuid}');
                  // Optionally, you can stop scanning after the first successful scan
                  camcontroller.stop();
                }else {
                  ToastService().showWarningToast('Pig not found in this farm');
                  context.replace('/home');
                  // Optionally, you can stop scanning after the first successful scan
                  camcontroller.stop();
                }
             
              }

              break; // Stop after the first successful scan
            }
          }
        },
      )
    );
  }

  @override
  void dispose() {
    camcontroller.dispose();
    super.dispose();
  }
}
