import 'package:flutter/material.dart';

class ActPopularCatDetails extends StatefulWidget {
  @override
  _ActPopularCatDetailsState createState() => _ActPopularCatDetailsState();
}

class _ActPopularCatDetailsState extends State<ActPopularCatDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('helments'),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Row $index'),
            );
          }),
    );
  }
}
