import 'package:flutter/material.dart';

class SecondScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('/second'),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/second-router');
          },
        ),
      ),
    );
  }
}
