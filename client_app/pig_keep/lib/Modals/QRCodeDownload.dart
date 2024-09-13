

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:flutter/services.dart';

class QRCodeDownload extends StatefulWidget {
  final String title;
  final String saveButtonText;
  final IconData saveButtonIcon;
  final Color saveButtonColor;
  final int number;
  final String imagePath;
  final VoidCallback onSave;

  const QRCodeDownload({
    super.key,
    required this.title,
    required this.saveButtonText,
    required this.saveButtonIcon,
    required this.saveButtonColor,
    required this.number,
    required this.imagePath,
    required this.onSave,
  });

  @override
  State<QRCodeDownload> createState() => _QRCodeDownloadState();
}

class _QRCodeDownloadState extends State<QRCodeDownload> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _captureAndSave() async {
    try {
      // Capture the widget
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Get the directory to save the file
      final directory = (await getApplicationDocumentsDirectory()).path;
      String filePath = '$directory/qr_code_image.png';

      // Save the image to the file system
      final File imgFile = File(filePath);
      await imgFile.writeAsBytes(pngBytes);

      // Optionally, save to the user's gallery
      final result = await ImageGallerySaver.saveFile(imgFile.path);
      print(result);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Image saved to your gallery!'),
      ));
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedNumber = widget.number.toString().padLeft(3, '0');

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
                color: appTertiary,
              ),
            ),
            SizedBox(height: 20.h),
            RepaintBoundary(
              key: _globalKey,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: appTertiary)),
                padding: const EdgeInsets.all(3.0),
                // Downloadable PNG for QR code, size set to 5cm x 3.7cm
                width: 188, 
                height: 141, 
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: formattedNumber
                          .split('')
                          .reversed
                          .map((digit) => RotatedBox(
                                quarterTurns: 3,
                                child: SizedBox(
                                  height: 40.h,
                                  child: Text(
                                    digit,
                                    style: TextStyle(
                                      height: 1.h,
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w700,
                                      color: appTertiary,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 141, 
                        maxWidth: 180, 
                      ),
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await _captureAndSave();
                  widget.onSave();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: appSecondary,
                  backgroundColor: widget.saveButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                icon: Icon(widget.saveButtonIcon),
                label: Text(widget.saveButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
