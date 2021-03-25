import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "3. Image 사용법";
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return SingleChildScrollView(
        // 스크롤되게 한다.
        child: buildColumn());
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Image 예제
        Center(
          child: Image.asset(
            "assets/images/title.jpg",
          ),
        ),
        Center(
          child: Image.asset(
            "assets/images/title.jpg",
            width: 100,
            height: 100,
          ),
        ),
        Center(
          child: Image.asset(
            "assets/images/title.jpg",
            width: 50,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Image.asset(
            "assets/images/title.jpg",
            width: 50,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Image.network(
              "http://vintageappmaker.com/wp-content/uploads/2015/03/cropped-logo.png"),
        )
      ],
    );
  }
}
