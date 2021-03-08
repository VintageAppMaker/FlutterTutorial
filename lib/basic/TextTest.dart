
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
     return MaterialApp(
       title: "1. Text 사용법",  
       home: Scaffold(
         appBar: AppBar( title: Text("Test 입니다."),),
         body: buildTestBody())
     );
  }

  Widget buildTestBody(){
    return Column(  // 세로방향으로 위젯을 추가한다[children]. Android의 LinearLayout
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Text 예제 
        Text("Test"), 
        Text("Test2", style: TextStyle(fontSize: 20)),
        Text("Test2", style: TextStyle(color: Colors.blue)),
       ],  
      );
    
  }
}