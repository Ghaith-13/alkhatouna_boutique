// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/launcher_icon"),
      iOS: DarwinInitializationSettings(
        requestSoundPermission: true,
        requestAlertPermission: true,
        requestBadgePermission: true,
      ),
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await notificationsPlugin.getNotificationAppLaunchDetails();
    final didNotificationLaunchApp =
        notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.didNotificationLaunchApp) {
      onTapLocalNotification(
          notificationAppLaunchDetails.notificationResponse!);
    }

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTapLocalNotification,
    );
  }

  pushRemoveNavigator(BuildContext context, {required Widget screen}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        settings: RouteSettings(name: screen.toString()),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(3, 3),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
      ),
      (route) => false,
    );
  }

  void onTapLocalNotification(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;

    // print(payload);

    var data = json.decode(payload!);
    // print(data);
    // print("Notification is");
    // print("///////////////////////////////////////");
    if (data["product"] != "0") {
      AppConstant.customNavigation(navigatorKey.currentContext!,
          ProductDetailsScreen(productId: data["product"]), -1, 0);
    } else if (data["category"] != "0") {
      AppConstant.customNavigation(
          navigatorKey.currentContext!,
          CategoriesScreen(
            categoryId: data["category"],
            title: "",
          ),
          -1,
          0);
    }
  }

  Future<NotificationDetails> _notificationDetails(String? imageUrl) async {
    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(ByteArrayAndroidBitmap.fromBase64String(""));
    if (imageUrl!.isNotEmpty) {
      final http.Response response = await http.get(Uri.parse(imageUrl));
      bigPictureStyleInformation = BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.bodyBytes)));
    }

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('01', 'Local Notification',
            importance: Importance.max,
            priority: Priority.high,
            styleInformation:
                imageUrl.isEmpty ? null : bigPictureStyleInformation);

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            // presentAlert: true,
            // presentBadge: true,
            // presentSound: true,
            );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    return notificationDetails;
  }

  Future<void> showLocalNotifications({
    required int id,
    required String title,
    required String body,
    required String? imageUrl,
    required String payload,
  }) async {
    final platformChannelSpecifics = await _notificationDetails(imageUrl);
    await notificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void showMessagefromServer(RemoteMessage message) async {
    // print(message.data);
    // print(message);
    // print(message.category);
    // print(message.messageType);
    // print(message.notification?.android?.imageUrl);
    // print(message.notification?.apple);
    // print(message.notification?.body);
    // print(message.notification?.bodyLocArgs);
    // print(message.notification?.title);
    // print(message.notification?.titleLocArgs);
    // print(message.notification?.titleLocKey);
    // print("message");
    showLocalNotifications(
      id: 0,
      title: "${message.notification?.title}",
      body: "${message.notification?.body}",
      imageUrl: "${message.notification?.android?.imageUrl ?? ""}",
      payload: json.encode(message.data),
    );
  }
}
