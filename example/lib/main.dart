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
              child: Text('Loadaksjdalksjdflkasdjfkjalsdjfls'),
              onPressed: waitFor,
            ),
            FutureRaisedButton.icon(
              icon: Icon(Icons.star),
              label: Text('Loadaksjdalksjdflkasdjfkjalsdjfls'),
              onPressed: waitFor,
            ),
            FutureIconButton(
              icon: Icon(Icons.link),
              onPressed: waitFor,
            ),
            FutureCupertinoButton(
              child: Text('Loadaksjdalksjdflkasdjfkjalsdjfls'),
              onPressed: waitFor,
            ),
            FutureCupertinoButton.filled(
              child: Text('Loadaksjdalksjdflkasdjfkjalsdjfls'),
              onPressed: waitFor,
            ),
          ],
        ),
      ),
    );
  }
}
