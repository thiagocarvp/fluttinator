import 'package:flutter/material.dart';

class MainScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('/second-router'),
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/second');
          },
        ),
      ),
    );
  }
}
