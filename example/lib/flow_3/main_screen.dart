import 'package:flutter/material.dart';
import 'package:fluttinator/fluttinator.dart';

class MainScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('/second-router/third-router'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            FluttinatorNavigator.handleDeeplink(
                '/second-router/second', context);
          },
        ),
      ),
    );
  }
}
