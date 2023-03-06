import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader_scanner/screens/create_qr_screen.dart';
import 'package:qr_reader_scanner/screens/scan_qr_screen.dart';
import 'package:qr_reader_scanner/src/app_colors.dart';
import 'package:qr_reader_scanner/utils/app_navigator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.kWhiteColor,
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 22.sp,
              color: AppColors.kBlackColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                AppNavigator.appNavigator(context, CreateScreen(),
                    isFinished: true);
              },
              child: Container(
                width: 240.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: AppColors.kBlackColor,
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Center(
                  child: Text(
                    "Generate QR".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20.sp, color: AppColors.kWhiteColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                AppNavigator.appNavigator(context, ScanScreen(),
                    isFinished: true);
              },
              child: Container(
                width: 240.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: AppColors.kBlackColor,
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Center(
                  child: Text(
                    "Read Qr".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20.sp, color: AppColors.kWhiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
