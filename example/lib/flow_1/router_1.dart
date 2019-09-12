import 'package:app/flow_1/main_screen.dart';
import 'package:app/flow_1/second_screen.dart';
import 'package:app/flow_2/router_2.dart';
import 'package:app/flow_3/router_3.dart';
import 'package:flutter/material.dart';
import 'package:fluttinator/fluttinator.dart';

class Router1 extends Fluttinator {
  @override
  Map<String, WidgetBuilder> get screenRoutes => {
        '/': (BuildContext buildContext) => MainScreen1(),
        'second': (BuildContext buildContext) => SecondScreen1(),
      };

  @override
  Map<String, NavigatorBuilder> get navigatorRoutes => {
        'second-router': SecondRouter.builder,
        'third-router': ThirdRouter.builder,
      };
}
