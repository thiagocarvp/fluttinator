import 'package:app/flow_1/router_1.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Router1 mainRouter = Router1();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainRouter,
      navigatorKey: mainRouter.navigatorKey,
    );
  }
}
