import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationProviderImpl {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> initialize(
      InitializationSettings settings, Function onSelectNotification) async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<void> showNotification(
    String title,
    String body,
    String payload,
    platformChannelSpecifics,
  ) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> schedule({
    @required String title,
    @required String body,
    @required DateTime date,
    @required NotificationDetails platformSpecifics,
    String payload,
    bool androidAllowWhileIdle = false,
  }) async {
    var scheduledNotificationDateTime = date;

    await flutterLocalNotificationsPlugin.schedule(
      0,
      title,
      body,
      scheduledNotificationDateTime,
      platformSpecifics,
      payload: payload,
    );
  }
}
