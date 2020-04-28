import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';

class NotificationProviderImpl {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final random = new Random();

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
      random.nextInt(100000000),
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
      random.nextInt(100000000),
      title,
      body,
      scheduledNotificationDateTime,
      platformSpecifics,
      payload: payload,
    );
  }

  Future<void> cancel(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<List<int>> listPendingNotificationsIds() async {
    List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    return pendingNotificationRequests.map<int>((el) => el.id).toList();
  }
}
