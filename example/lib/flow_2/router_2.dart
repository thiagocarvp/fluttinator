import 'package:app/flow_2/main_screen.dart';
import 'package:app/flow_2/second_screen.dart';
import 'package:app/flow_3/router_3.dart';
import 'package:flutter/material.dart';
import 'package:fluttinator/fluttinator.dart';

class SecondRouter extends Fluttinator {
  SecondRouter({
    FluttinatorSettings settings,
  }) : super(settings: settings);

  @override
  Map<String, WidgetBuilder> get screenRoutes => {
        '/': (BuildContext buildContext) => MainScreen2(),
        'second': (BuildContext buildContext) => SecondScreen2(),
      };

  @override
  Map<String, NavigatorBuilder> get navigatorRoutes => {
        'third-router': ThirdRouter.builder,
      };

  static NavigatorBuilder get builder => (FluttinatorSettings settings) =>
      (BuildContext context) => SecondRouter(settings: settings);
}
