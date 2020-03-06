
import 'package:flutter/material.dart';

class Act_NewsTab extends StatelessWidget {
  final String title;
  final ValueChanged<int> onPush;

  const Act_NewsTab({Key key, this.title, this.onPush}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: (){
            },
            child: Text('Click Here'),
          ),
        ),
      ),
    );
  }
}

