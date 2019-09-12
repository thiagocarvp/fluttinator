import 'package:flutter/material.dart';

class SecondScreen2 extends StatelessWidget {
  SecondScreen2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('/second-router/second'),
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third-router');
              },
            ),
            RaisedButton(
              child: Text('pop'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
