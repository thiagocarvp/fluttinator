import 'package:app/fluttinator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var navigator = Fluttinator(
      screenRoutes: {
        '/': (BuildContext buildContext) => MainScreen(),
        'second': (BuildContext buildContext) => SecondScreen(),
      },
      navigatorRoutes: {
        'second-navigator': (String initialRoute) =>
            (BuildContext buildContext) => SecondNavigator(
                  initialRoute: initialRoute,
                ),
      },
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: navigator,
      navigatorKey: navigator.navigatorKey,
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
            Navigator.of(context)
                .pushNamed('/second-navigator/third-navigator');
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
            Navigator.of(context).pushNamed('/second-navigator');
          },
        ),
      ),
    );
  }
}

class SecondNavigator extends StatelessWidget {
  final String initialRoute;

  SecondNavigator({
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Fluttinator(
      initialRoute: this.initialRoute,
      screenRoutes: {
        '/': (BuildContext buildContext) => MainScreen2(),
        'second': (BuildContext buildContext) => SecondScreen2(),
      },
      navigatorRoutes: {
        'third-navigator': (String initialRoute) =>
            (BuildContext buildContext) => ThirdNavigator(
                  initialRoute: initialRoute,
                ),
      },
    );
  }
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
            Navigator.of(context).pop();
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

class ThirdNavigator extends StatelessWidget {
  final String initialRoute;

  ThirdNavigator({
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Fluttinator(
      initialRoute: this.initialRoute,
      screenRoutes: {
        '/': (BuildContext buildContext) => MainScreen3(),
      },
    );
  }
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
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
