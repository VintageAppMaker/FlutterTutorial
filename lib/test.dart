import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Number {
  int value;

  Number(this.value);

  factory Number.fromJSON(Map<String, dynamic> json) {
    return Number(json['value']);
  }
}

Future<Number> getNumber({int num = 20}) async {
  http.Response res = await http.get(Uri.http("dummyresponse.pythonanywhere.com", "/api/$num"));
  print(res.body);
  return Number.fromJSON(json.decode(res.body));
}

Stream<Number> getNumbers(Duration refreshTime) async* {
  while (true) {
    await Future.delayed(refreshTime);
    yield await getNumber();
  }
}

class StreamBuilderExample extends StatefulWidget {
  StreamBuilderExample({Key key}) : super(key: key);

  @override
  _StreamBuilderExampleState createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder(
            stream: getNumbers(Duration(seconds: 1)),
            initialData: Number(0),
            builder: (context, stream) {
              if (stream.connectionState == ConnectionState.done) {
                return Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                );
              }
              if (stream.hasData) {
                return LikeCounter(stream.data.value);
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}

class LikeCounter extends StatelessWidget {
  static List<Color> colors = [
    Colors.green,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.blueAccent,
    Colors.deepOrangeAccent
  ];
  final int num;

  LikeCounter(this.num);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: colors[num % colors.length],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.favorite, color: Colors.white),
          Text(
            " $num Likes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}