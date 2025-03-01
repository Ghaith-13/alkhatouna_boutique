// import 'dart:async';

// import 'package:app_links/app_links.dart';
// import 'package:flutter/material.dart';

// class UniServices {
//   static final navigatorKey = GlobalKey<NavigatorState>();

//   static initDeepLink() async {
//     late AppLinks appLinks;
//     StreamSubscription<Uri>? linkSubscription;
//     Future<void> initDeepLinks() async {
//       appLinks = AppLinks();

//       // Handle links
//       linkSubscription = appLinks.uriLinkStream.listen((uri) {
//         debugPrint('onAppLink: $uri');
//         openAppLink(uri);
//       });
//     }
//   }

//   static openAppLink(Uri uri) {
//     navigatorKey.currentState?.pushNamed(uri.fragment);
//   }
// }
