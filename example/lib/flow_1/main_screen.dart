import 'package:flutter/material.dart';

class MainScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('/'),
      ),
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
