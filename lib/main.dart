import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/firebase_options.dart';
import 'package:alkhatouna/services/local_notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/bloc_provider.dart';
import 'package:alkhatouna/splash_screen.dart';
import 'config/themes/app_themes.dart';
import 'core/utils/cache_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'injection_container.dart' as di;

/// Handles background messages from Firebase Messaging.
@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  LocalNotificationService().showMessagefromServer(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize other services
  await di.init();
  await CacheHelper.init();

  // Firebase Messaging instance
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Retrieve FCM Token for Debugging
  try {
    String? token = await messaging.getToken();
    print("FCM Token: $token");
  } catch (e) {
    print("Error retrieving FCM token: $e");
  }

  // Listen for foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    LocalNotificationService().showMessagefromServer(event);
  });

  // Set up background message handling
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

  // Listen for notification interaction
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    navigatorKey.currentState?.pushNamed("/productDetails", arguments: {
      "productId": message.data['productId'],
    });
  });

  // Run the app
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return blocMultiProvider(
            child: BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                return MaterialApp(
                  routes: {
                    "/productDetails": (context) => ProductDetailsScreen(
                          productId: "1",
                        ),
                  },
                  navigatorKey: navigatorKey,
                  locale: state.locale,
                  supportedLocales: const [
                    Locale("en"),
                    Locale("ar"),
                  ],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  localeResolutionCallback: (deviceLocal, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocal != null &&
                          deviceLocal.languageCode == locale.languageCode) {
                        return deviceLocal;
                      }
                    }
                    return supportedLocales.first;
                  },
                  title: 'AlKhatouna Boutique',
                  debugShowCheckedModeBanner: false,
                  theme: appTheme(state.locale.languageCode),
                  home: const SplashScreen(),
                );
              },
            ),
          );
        });
  }
}
