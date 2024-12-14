import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:animate_do/animate_do.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goToNextPage() async {
    await Future.delayed(Duration(
      seconds: 3,
    ));

    var token = await CacheHelper.getData(key: "USER_TOKEN");
    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const mainScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const SignUpScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    requestNotificationPermissions();
    goToNextPage();
    super.initState();
  }

  Future<void> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      // Notification permissions granted, proceed as normal
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Skip handling and proceed to the app without opening settings
      print(
          "Notification permissions not granted. Proceeding without notifications.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInDownBig(
                  animate: true,
                  duration: Duration(milliseconds: 150),
                  child: Image.asset(
                    'assets/images/logo-removebg.png',
                    width: 0.9.sw,
                    height: 0.5.sh,
                  ),
                ),
              ],
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Alkhatouna Boutique",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.white),
                  speed: const Duration(milliseconds: 150),
                ),
              ],
              totalRepeatCount: 1,
            )
          ],
        ),
      ),
    );
  }
}
