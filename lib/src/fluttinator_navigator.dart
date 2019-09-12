import 'package:flutter/material.dart';

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

  static FluttinatorNavigatorState of(
    context, {
    bool rootNavigator = false,
    bool nullOk = false,
  }) {
    final FluttinatorNavigatorState navigator = rootNavigator
        ? context.rootAncestorStateOfType(
            const TypeMatcher<FluttinatorNavigatorState>())
        : context.ancestorStateOfType(
            const TypeMatcher<FluttinatorNavigatorState>());
    assert(() {
      if (navigator == null && !nullOk) {
        throw FlutterError(
            'FluttinatorNavigator operation requested with a context that does not include a FluttinatorNavigator.\n'
            'The context used to push or pop routes from the FluttinatorNavigator must be that of a '
            'widget that is a descendant of a FluttinatorNavigator widget.');
      }
      return true;
    }());
    return navigator;
  }

  static Future handleDeeplink(String deeplink, BuildContext context) {
    FluttinatorNavigatorState rootNavigator =
        FluttinatorNavigator.of(context, rootNavigator: true);
    return rootNavigator.pushNamed(deeplink);
  }
}

class FluttinatorNavigatorState extends NavigatorState {
  FluttinatorNavigatorState parentNavigator;

  @override
  void initState() {
    super.initState();
    this.parentNavigator = FluttinatorNavigator.of(context, nullOk: true);
  }

  @override
  bool canPop() {
    return this.parentNavigator != null;
  }

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
