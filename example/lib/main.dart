import 'package:fluttinator/fluttinator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MainRouter extends Fluttinator {
  @override
  Map<String, WidgetBuilder> get screenRoutes => {
        '/': (BuildContext buildContext) => MainScreen(),
        'second': (BuildContext buildContext) => SecondScreen(),
      };

  @override
  Map<String, NavigatorBuilder> get navigatorRoutes => {
        'second-router': SecondRouter.builder,
        'third-router': ThirdRouter.builder,
      };
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainRouter mainRouter = MainRouter();

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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/third-router');
          },
        ),
      ),
    );
  }
}

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

class MainScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.pink,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            FluttinatorNavigator.handleDeeplink(
              '/second-router/second',
              context,
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen2 extends StatelessWidget {
  SecondScreen2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.yellow,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigator.of(Navigator.of(context).context).pop();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

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

class MainScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
