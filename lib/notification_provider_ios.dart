import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test_notifications/notification_manager_interface.dart';
import 'package:flutter_test_notifications/notification_provider_impl.dart';

class NotificationProviderIOS extends NotificationProviderImpl
    implements NotificationProvider {
  Future<void> init(Function onSelectNotification) async {
    await super.initialize(
      InitializationSettings(
        null,
        IOSInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
          onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
        ),
      ),
      onSelectNotification,
    );
    return null;
  }

  _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {
    print(id);
    print(title);
    print(payload.toString());
  }

  Future<void> show(String title, String body, String payload) async {
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      null,
      iOSPlatformChannelSpecifics,
    );

    super.showNotification(title, body, payload, platformChannelSpecifics);
  }

  Future<void> requestPermission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  @override
  Future<void> scheduleNotification({
    String title,
    String body,
    DateTime date,
    String payload,
  }) {
    // TODO: implement scheduleNotification
    return null;
  }
}
