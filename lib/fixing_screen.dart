import 'package:alkhatouna/config/themes/app_themes.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixingScreen extends StatefulWidget {
  const FixingScreen({super.key});

  @override
  State<FixingScreen> createState() => _FixingScreenState();
}

class _FixingScreenState extends State<FixingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo-removebg-preview.png"),
            20.ph,
            Text(
              "التطبيق قيد الصيانة الآن",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            Text(
              " تستطيع الطلب عبر الواتساب أو من صفحتنا على الانستگرام",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            )
          ],
        ),
      ),
    );
  }
}
