import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Woolha.com | InheritedWidget Example'),
          backgroundColor: Colors.teal,
        ),
        body: InheritedWidgetExample(),
      ),
    );
  }
}

class InheritedWidgetExample extends StatefulWidget {

  @override
  _InheritedWidgetExampleState createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {

  final Random _random = Random();
  int _score = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Info(
            score: _score,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.score),
                CurrentScore(),
              ],
            ),
          ),
          OutlinedButton(
            child: const Text('Change'),
            onPressed: () {
              setState(() {
                _score = _random.nextInt(100);
              });
            },
          ),
        ],
      ),
    );
  }
}

class Info extends InheritedWidget {

  const Info({
    Key key,
    @required this.score,
    @required Widget child,
  }) : assert(score != null),
        assert(child != null),
        super(key: key, child: child);

  final int score;

  static Info of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Info>();
  }

  @override
  bool updateShouldNotify(covariant Info oldWidget) {
    return oldWidget.score != score;
  }
}

class CurrentScore extends StatelessWidget {

  const CurrentScore();

  @override
  Widget build(BuildContext context) {
    print('CurrentScore rebuilt');
    final Info info = Info.of(context);

    return Container(
      child: Text(info?.score.toString()),
    );
  }
}