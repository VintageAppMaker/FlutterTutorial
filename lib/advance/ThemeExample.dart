// test area
import 'package:flutter/material.dart';

class ThemeExample extends StatefulWidget {
  const ThemeExample({Key key}): super(key: key);
  //1
  @override
  _ThemeExampleState createState() => _ThemeExampleState();
}

class _ThemeExampleState extends State {

  String sTitle = '32. Theme 예제';
  bool isLight = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(sTitle),
          backgroundColor: Theme.of(context).appBarTheme.color,
          textTheme: Theme.of(context).textTheme,
        ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            Text('테마를 변경합니다.'),
            const SizedBox(
              height: 32.0,
            ),
            RaisedButton(
              child: Text('테마변경'),
              onPressed: () => setState(() { isLight = !isLight;}),
            ),
          ],
        ),),
      ),
      theme: getTheme(),
    );
  }

  ThemeData getTheme() {if (isLight == true) return CustomTheme.lightTheme; else return CustomTheme.redTheme;}
}

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        textTheme: TextTheme(body1: TextStyle(color: Colors.grey), body2: TextStyle(color: Colors.grey)),
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            buttonColor: Colors.white,
            height: 60

        )
    );
  }

  static ThemeData get redTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: Colors.red,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
          buttonColor: Colors.amber,
          textTheme: ButtonTextTheme.primary,
        )
    );
  }
}
