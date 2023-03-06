import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader_scanner/src/app_colors.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrstr = "let's Scan it";
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.kWhiteColor,
          title: const Text(
            'Scanning QR code',
            style: TextStyle(
                color: AppColors.kBlackColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Text(
                qrstr,
                style: const TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: 30,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: scanQr,
                child: Container(
                  width: 240.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.kBlackColor,
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Center(
                    child: Text(
                      "Scanner",
                      style: TextStyle(
                          color: AppColors.kWhiteColor, fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ));
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrstr = value;
        });
      });
    } catch (e) {
      setState(() {
        qrstr = 'unable to read this';
      });
    }
  }
}
