import 'package:fluttinator/src/fluttinator_navigator.dart';
import 'package:fluttinator/src/page_route.dart';
import 'package:flutter/material.dart';

typedef NavigatorBuilder = Fluttinator Function(BuildContext context) Function(
  FluttinatorSettings settings,
);

class FluttinatorSettings {
  final String initialRoute;

  FluttinatorSettings(
    this.initialRoute,
  );
}

class Fluttinator extends StatefulWidget {
  final FluttinatorSettings settings;
  GlobalKey<FluttinatorNavigatorState> get navigatorKey => null;
  Map<String, WidgetBuilder> get screenRoutes => {};
  Map<String, NavigatorBuilder> get navigatorRoutes => {};
  String get initialRoute => settings?.initialRoute ?? '/';

  Fluttinator({
    this.settings,
  });

  @override
  FluttinatorState createState() => FluttinatorState();

  static NavigatorBuilder get builder => (FluttinatorSettings settings) =>
      (BuildContext context) => Fluttinator(settings: settings);
}

class FluttinatorState extends State<Fluttinator> {
  GlobalKey<FluttinatorNavigatorState> _navigator;
  FluttinatorNavigatorState get navigator => _navigator.currentState;

  @override
  void initState() {
    super.initState();
    _updateNavigator();
  }

  @override
  void didUpdateWidget(Fluttinator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navigatorKey != oldWidget.navigatorKey) {
      _updateNavigator();
    }
  }

  void _updateNavigator() {
    _navigator =
        widget.navigatorKey ?? GlobalObjectKey<FluttinatorNavigatorState>(this);
  }

  Route<dynamic> _onGenerateRoute(RouteSettings routeSettings) {
    Uri uri = Uri.parse(routeSettings.name);
    if (uri.pathSegments.isEmpty) {
      return FluttinatorPageRoute(
          builder: widget.screenRoutes[widget.initialRoute]);
    } else {
      String path = uri.pathSegments[0];
      if (widget.navigatorRoutes.containsKey(path)) {
        String remainingPath = uri.pathSegments.length > 1
            ? uri.pathSegments.sublist(1).reduce(
                  (String a, String b) => a + '/' + b,
                )
            : '/';
        return FluttinatorPageRoute(
          builder:
              widget.navigatorRoutes[path](FluttinatorSettings(remainingPath)),
        );
      } else if (widget.screenRoutes.containsKey(path)) {
        return MaterialPageRoute(
          builder: widget.screenRoutes[path],
        );
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FluttinatorNavigator(
      key: _navigator,
      onGenerateRoute: _onGenerateRoute,
      initialRoute: widget.initialRoute,
    );
  }
}
