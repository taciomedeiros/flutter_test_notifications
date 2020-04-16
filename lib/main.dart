import 'package:flutter/material.dart';
import 'package:flutter_test_notifications/notification_manager.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationManager.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NavigationService.navigationKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${NotificationManager.test}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue[100],
              child: Text('Show notification'),
              onPressed: () {
                NotificationManager.instance.showNotification(
                  'Notification Test',
                  'Simple Showing notification',
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.green[100],
              child: Text('Show notification and change page'),
              onPressed: () {
                NotificationManager.instance.showNotification(
                  'Notification Test',
                  'Simple Showing notification',
                  payload: 'change-page',
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.amber[100],
              child: Text('Schedule notification +15 seconds'),
              onPressed: () {
                NotificationManager.instance.scheduleNotification(
                  title: 'Notification Test',
                  body: 'Scheduled Notification +15 seconds',
                  date: DateTime.now().add(
                    Duration(seconds: 15),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.amber[100],
              child: Text('Schedule notification +15 seconds With action'),
              onPressed: () {
                NotificationManager.instance.scheduleNotification(
                  title: 'Notification Test',
                  body: 'Scheduled Notification +15 seconds',
                  payload: 'change-page',
                  date: DateTime.now().add(
                    Duration(seconds: 15),
                  ),
                );
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
