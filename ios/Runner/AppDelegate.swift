import Flutter
import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Configure Firebase
    FirebaseApp.configure()

    // Register for notifications and request authorization
    if #available(iOS 10.0, *) {
      let center = UNUserNotificationCenter.current()
      center.delegate = self  // Ensures notifications are forwarded properly.
      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      center.requestAuthorization(options: authOptions) { granted, error in
        if let error = error {
          print("Notification authorization error: \(error.localizedDescription)")
        } else {
          print("Notification permission granted: \(granted)")
        }
      }
    } else {
      let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }

    application.registerForRemoteNotifications()

    // Set Firebase Messaging delegate
    Messaging.messaging().delegate = self

    // Register Flutter plugins
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Handle APNS device token
  override func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    Messaging.messaging().apnsToken = deviceToken
    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }
  
  // Forward remote notifications to Firebase Messaging when the proxy is disabled.
  override func application(_ application: UIApplication,
                            didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                            fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    Messaging.messaging().appDidReceiveMessage(userInfo)
    completionHandler(UIBackgroundFetchResult.newData)
  }

  // MARK: - UNUserNotificationCenterDelegate methods
  
  @available(iOS 10.0, *)
  override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    // Show notification even when the app is in the foreground.
    completionHandler([.alert, .badge, .sound])
  }

  @available(iOS 10.0, *)
  override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse,
                                       withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    print("User interacted with notification: \(userInfo)")
    completionHandler()
  }

  // MARK: - Firebase Messaging Delegate

  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    guard let fcmToken = fcmToken else {
      print("Failed to receive FCM token")
      return
    }
    print("FCM Token: \(fcmToken)")
    // Optionally, send the token to your backend server.
  }
}
