import 'package:FlutterTutorial/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tutorial"),
        ),
        body: SingleChildScrollView(child: buildCenter(context)));
  }

  Center buildCenter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildOutlinedButton(context, "/TextExample", "1. Text 예제"),
          buildOutlinedButton(context, "/ButtonExample", "2. Button 예제"),
          buildOutlinedButton(context, "/ImageExample", "3. Image 예제"),
          buildOutlinedButton(context, "/TextFieldExample", "4. FormField 예제"),
          buildOutlinedButton(context, "/FormFieldExample", "5. FormField 예제")
        ],
      ),
    );
  }

  OutlinedButton buildOutlinedButton(
      BuildContext context, String sDestination, String sTitle) {
    return OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)),
        onPressed: () {
          Navigator.pushNamed(context, sDestination);
        },
        child: Text(sTitle, style: TextStyle(color: Colors.white)));
  }
}
