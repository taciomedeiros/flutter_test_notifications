import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_notifications/notification_provider_android.dart';
import 'package:flutter_test_notifications/notification_manager_interface.dart';
import 'package:flutter_test_notifications/notification_provider_ios.dart';
import 'package:flutter_test_notifications/second_screen.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class NotificationManager {
  NotificationManager._();

  NotificationProvider notificator;
  static final NotificationManager _instance = NotificationManager._();

  static NotificationManager get instance => _instance;
  static String test = 'blaus';

  initialize() async {
    notificator = Platform.isIOS
        ? NotificationProviderIOS()
        : NotificationProviderAndroid();

    await notificator.init(_onNotificationTap);
  }

  Future _onNotificationTap(String payload) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }

    // @todo verificar pq esta chamando duas vezes
    if (payload == 'change-page') {
      NotificationManager.test = payload;
      await navService.push(
        MaterialPageRoute(builder: (context) => SecondScreen(payload: payload)),
      );
    }
  }

  showNotification(String title, String body, {String payload}) {
    notificator.show(title, body, payload);
  }

  scheduleNotification({
    String title,
    String body,
    DateTime date,
    String payload,
  }) {
    notificator.scheduleNotification(
      title: title,
      body: body,
      date: date,
      payload: payload,
    );
  }
}
