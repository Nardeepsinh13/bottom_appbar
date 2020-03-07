import 'package:flutter/material.dart';

class ActFloatingScreen extends StatelessWidget {
  final String title;
  final ValueChanged<int> onPush;

  const ActFloatingScreen({Key key, this.title, this.onPush}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 20.0),
              color: Colors.blue,
            ),
            FloatingActionButton(
              child: Icon(Icons.access_alarm),
              onPressed: (){},
            )
          ],
        )
      ],
    ));
  }
}
