import 'package:app/flow_3/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttinator/fluttinator.dart';

class ThirdRouter extends Fluttinator {
  ThirdRouter({
    FluttinatorSettings settings,
  }) : super(settings: settings);

  @override
  Map<String, WidgetBuilder> get screenRoutes => {
        '/': (BuildContext buildContext) => MainScreen3(),
      };

  @override
  Map<String, NavigatorBuilder> get navigatorRoutes => {};

  static NavigatorBuilder get builder => (FluttinatorSettings settings) =>
      (BuildContext context) => ThirdRouter(settings: settings);
}
