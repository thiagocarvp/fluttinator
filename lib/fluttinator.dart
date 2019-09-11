import 'package:flutter/material.dart';

typedef NavigatorBuilder = Widget Function(BuildContext context) Function(
    String initialRoute);

class Fluttinator extends StatefulWidget {
  final GlobalKey<FluttinatorNavigatorState> navigatorKey;
  final Map<String, WidgetBuilder> screenRoutes;
  final Map<String, NavigatorBuilder> navigatorRoutes;
  final String initialRoute;

  Fluttinator({
    this.navigatorKey,
    screenRoutes,
    navigatorRoutes,
    this.initialRoute: '/',
  })  : this.screenRoutes = screenRoutes ?? {},
        this.navigatorRoutes = navigatorRoutes ?? {};

  @override
  FluttinatorState createState() => FluttinatorState();
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
            builder: widget.navigatorRoutes[path](remainingPath));
      } else if (widget.screenRoutes.containsKey(path)) {
        return FluttinatorPageRoute(builder: widget.screenRoutes[path]);
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

class FluttinatorNavigator extends Navigator {
  FluttinatorNavigator({
    GlobalKey<FluttinatorNavigatorState> key,
    Route<dynamic> Function(RouteSettings) onGenerateRoute,
    String initialRoute,
  }) : super(
          key: key,
          onGenerateRoute: onGenerateRoute,
          initialRoute: initialRoute,
        );

  @override
  FluttinatorNavigatorState createState() => FluttinatorNavigatorState();
}

class FluttinatorNavigatorState extends NavigatorState {
  @override
  bool pop<T extends Object>([T result]) {
    bool result = super.pop();
    if (!result) {
      Navigator.of(super.context).pop();
    }
    return result;
  }

  @override
  Future<bool> maybePop<T extends Object>([T result]) async {
    return pop();
  }
}

class FluttinatorPageRoute extends MaterialPageRoute {
  FluttinatorPageRoute({
    @required builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        assert(opaque),
        super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  bool get canPop => true;
}
