import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "5. Layout 사용법",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Test 입니다."),
            ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // layout 예제
        buildCenterColumn(),
        buildCenterRow(), 
        buildSizedBox()
      ],
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      width : 100, 
      height : 100, 
      child: Container(
          width: double.infinity, 
          color: Colors.orange, 
          child: Text("Sized", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.indigo),)
        )
    );
  }

  Center buildCenterColumn() {
    return Center( child: 
        Container(color: Colors.amber, width: double.infinity, margin: EdgeInsets.all(16), 
          child: Column( 
            children: [ for(int i =0; i< 10; i++) Text("$i") ],
        )),
      );
  }

  Widget buildCenterRow() {
    return Container(color: Colors.cyan, width: double.infinity, margin: EdgeInsets.all(6), 
          child: Row( 
            children: [ for(int i =0; i< 10; i++) Text("$i") ],
        ));
  }
}
