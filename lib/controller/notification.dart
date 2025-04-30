import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await FirebaseNotificationController.instance.initNotification();
  await FirebaseNotificationController.instance.showNotification(message);
}

class FirebaseNotificationController {
  FirebaseNotificationController._();
  static final FirebaseNotificationController instance =
      FirebaseNotificationController._();

  final _messaging = FirebaseMessaging.instance;
  final _localnotification = FlutterLocalNotificationsPlugin();
  bool _isInit = false;

  Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await requestNotificationPermission();

    await _setupMessageHandler();

    await _messaging.getToken().then((token) {
      print("FCM Token: $token");
    });
  }

  Future<void> requestNotificationPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
  }

  Future<void> initNotification() async {
    if (_isInit) return;

    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localnotification
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _localnotification.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print("Notification clicked: ${details.payload}");
      },
    );
    _isInit = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      await _localnotification.show(
        notification.hashCode,
        notification.title,
        notification.body,

        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            icon: '@mipmap/ic_launcher',
            priority: Priority.high,

            showWhen: false,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  Future<void> _setupMessageHandler() async {
    FirebaseMessaging.onMessage.listen((message) {
      print("Message received: ${message.notification?.title}");
      print("Message body: ${message.notification?.body}");
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    final InitialMessage = await _messaging.getInitialMessage();
    if (InitialMessage != null) {
      print(
        "App opened from background: ${InitialMessage.notification?.title}",
      );
      print("App opened from background: ${InitialMessage.notification?.body}");
      _handleBackgroundMessage(InitialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    print("Message clicked: ${message.notification?.title}");
    print("Message body: ${message.notification?.body}");
  }

  /*
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> requestNotificationPermission() async {
    await _firebaseMessaging.requestPermission();

    final FCM_Token = await _firebaseMessaging.getToken();
    print("FCM Token: $FCM_Token");

    initFirebaseMessaging();
  }

  void handleMessage(RemoteMessage? message) {
    if (message != null) {
      print("Message received: ${message.notification?.title}");
      print("Message body: ${message.notification?.body}");
    } else {
      return;
    }
  }

  Future<void> initFirebaseMessaging() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleMessage(message);
    });
  }*/
}
