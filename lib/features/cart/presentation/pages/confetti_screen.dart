import 'package:alkhatouna/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';

class ConfettiScreen extends StatefulWidget {
  @override
  _ConfettiScreenState createState() => _ConfettiScreenState();
}

class _ConfettiScreenState extends State<ConfettiScreen> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 30));
    _playConfetti();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  void _playConfetti() {
    _controllerCenter.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 343.w,
          height: 48.h,
          child: ElevatedButton(
            child: Text(
              "Continue shopping".tr(context),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => mainScreen(
                          refresheveyThing: false,
                        )),
                (Route route) => false,
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // optional
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/bags.png",
                ),
                30.ph,
                Text(
                  "Success!".tr(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34.sp,
                  ),
                ),
                5.ph,
                Text(
                  "Your order will be delivered soon Thank you for shopping from Khatouna"
                      .tr(context),
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
