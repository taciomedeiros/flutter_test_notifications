abstract class NotificationProvider {
  Future<void> show(String title, String body, String payload);
  Future<void> requestPermission();
  Future<void> init(Function onSelectNotification);
  Future<void> scheduleNotification({
    String title,
    String body,
    DateTime date,
    String payload,
  });
}
