import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String payload;
  SecondScreen({this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SecondScreen',
            ),
            Text(
              'Estamos na segunda tela',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              payload,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
