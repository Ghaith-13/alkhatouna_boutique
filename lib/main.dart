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

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  LocalNotificationService().showMessagefromServer(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  await CacheHelper.init();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.subscribeToTopic('all-users');
  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    onBackgroundMessage(event);
  });
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
