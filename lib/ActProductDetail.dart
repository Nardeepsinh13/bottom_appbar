import 'package:flutter/material.dart';

class ActProductDetail extends StatefulWidget {
  @override
  _ActProductDetailState createState() => _ActProductDetailState();
}

class _ActProductDetailState extends State<ActProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
      ),
      body: Container(
        child: Center(
          child: Text('details'),
        ),
      ),
    );
  }
}
