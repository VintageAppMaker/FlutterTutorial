import 'package:flutter/material.dart';
import 'basic/TextExample.dart';
import 'basic/ButtonExample.dart';
import 'main.dart';

// 화면이동
// runApp에 넘겨지는 위젯의 routes: 파라메터에 넘긴다.
final routes = {
  '/': (BuildContext context) => MainPage(),
  '/TextTest': (BuildContext context) => TextExample(),
  '/ButtonTest': (BuildContext context) => ButtonExample()
};
