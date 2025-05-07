import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  final supabase = Supabase.instance.client;

  bool _initialized = false;

  bool get initialized => _initialized;

  // Initialize the [FlutterLocalNotificationsPlugin] package.

  Future<void> init() async {
    if (_initialized) return;

    const initSettingAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const initSettingIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingIOS,
    );

    await notificationsPlugin.initialize(initSettings);
    _initialized = true; // Ensure _initialized is updated
  }

  // Notifications detail setup

  NotificationDetails notificationsDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channel_id', 'channel_name',
          channelDescription: 'channel_description',
          importance: Importance.max,
          priority: Priority.high),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  // Show notification

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    await notificationsPlugin.show(id, title, body, notificationsDetails());
  }

  Future<void> initializeFirebaseMessaging() async {
    supabase.auth.onAuthStateChange.listen((event) async {
      if (event.event == AuthChangeEvent.signedIn) {
        await FirebaseMessaging.instance.requestPermission();

        await FirebaseMessaging.instance.getAPNSToken();

        final fcmToken = await FirebaseMessaging.instance.getToken();

        if (fcmToken != null) {
          await _setFcmToken(fcmToken);
        }
      }
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      await _setFcmToken(fcmToken);
    });

    FirebaseMessaging.onMessage.listen((payload) async {
      final notification = payload.notification;

      if (notification != null) {
        await showNotification(
          title: notification.title,
          body: notification.body,
        );
      }
    });
  }

  Future<void> _setFcmToken(String fcmToken) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId != null) {
      await supabase
          .from('profiles')
          .upsert({'id': userId, 'fcm_token': fcmToken});
    }
  }
}
