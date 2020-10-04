import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_button/future_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Future Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> waitFor([int seconds = 2]) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Future<void> waitForAndFail([int seconds = 2]) async {
    await Future.delayed(Duration(seconds: seconds));
    throw Exception();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureRaisedButton(
              child: Text('Load'),
              onPressed: waitFor,
              showResult: true,
            ),
            FutureRaisedButton(
              child: Text('Load (right)'),
              onPressed: waitForAndFail,
              progressIndicatorLocation: ProgressIndicatorLocation.right,
              showResult: true,
            ),
            FutureRaisedButton.icon(
              icon: Icon(Icons.star),
              label: Text('Star'),
              onPressed: waitFor,
              showResult: false,
            ),
            FutureIconButton(
              icon: Icon(Icons.link),
              onPressed: waitFor,
              showResult: true,
            ),
            FutureCupertinoButton(
              child: Text('Like'),
              onPressed: waitFor,
              showResult: true,
            ),
            FutureCupertinoButton.filled(
              child: Text('Like'),
              onPressed: waitForAndFail,
              showResult: true,
            ),
          ],
        ),
      ),
    );
  }
}
