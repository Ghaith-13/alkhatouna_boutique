import 'package:alkhatouna/main_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
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
  @override
  void initState() {
    requestNotificationPermissions();
    super.initState();
  }

Future<void> requestNotificationPermissions() async {
  final PermissionStatus status = await Permission.notification.request();

  if (status.isGranted) {
    // Notification permissions granted, proceed as normal
  } else if (status.isDenied || status.isPermanentlyDenied) {
    // Skip handling and proceed to the app without opening settings
    print("Notification permissions not granted. Proceeding without notifications.");
  }
}


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
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

            // pause: const Duration(milliseconds: 1000),
            // displayFullTextOnTap: false,
            // stopPauseOnTap: false,
          )
        ],
      ),
      nextScreen: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            var token = snapshot.data?.getString('USER_TOKEN');
            if (token != null) {
              return const mainScreen();
            } else {
              return const SignUpScreen();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      backgroundColor: AppColors.primaryColor,
      splashIconSize: 500,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
