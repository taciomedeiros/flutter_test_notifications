import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test_notifications/notification_manager_interface.dart';
import 'package:flutter_test_notifications/notification_provider_impl.dart';

class NotificationProviderAndroid extends NotificationProviderImpl
    implements NotificationProvider {
  // @todo revisitar estes canais
  final AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ticker: 'ticker',
    playSound: true,
    sound: RawResourceAndroidNotificationSound('slow_spring_board'),
  );

  NotificationDetails _notificationDetails;

  NotificationProviderAndroid() {
    _notificationDetails = NotificationDetails(
      _androidNotificationDetails,
      null,
    );
  }

  Future<void> init(Function onSelectNotification) async {
    await initialize(
      InitializationSettings(
        AndroidInitializationSettings('icon'),
        null,
      ),
      onSelectNotification,
    );

    return null;
  }

  @override
  Future<void> requestPermission() {
    return null;
  }

  @override
  Future<void> show(String title, String body, String payload) {
    super.showNotification(title, body, payload, _notificationDetails);
    return null;
  }

  Future<void> scheduleNotification({
    @required String title,
    @required String body,
    String payload,
    DateTime date,
  }) async {
    super.schedule(
      title: title,
      body: body,
      date: date,
      platformSpecifics: _notificationDetails,
      androidAllowWhileIdle: true,
      payload: payload,
    );
  }
}
