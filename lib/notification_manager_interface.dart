abstract class NotificationProvider {
  Future<void> show(String title, String body, String payload);
  Future<void> requestPermission();
  Future<void> init(Function onSelectNotification);
  Future<void> cancel(int id);
  Future<List<int>> listPendingNotificationsIds();
  Future<void> scheduleNotification({
    String title,
    String body,
    DateTime date,
    String payload,
  });
}
