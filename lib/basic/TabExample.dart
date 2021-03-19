import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabExample extends StatelessWidget {
  String sTitle = "8. Tab 사용법";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            // appBar: AppBar(
            //   title: Text(sTitle),
            // ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return DefaultTabController(
      // 탭의 수 설정
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // TabBar
          title: Text(sTitle),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(text: "2"),
              Tab(icon: Icon(Icons.directions_bike), text: "3"),
            ],
          ),
        ),

        // TabVarView
        body: TabBarView(
          children: [
            Center(
              child: Text(
                "1",
                style: TextStyle(fontSize: 40, color: Colors.black38),
              ),
            ),
            Center(
              child: Text(
                "2",
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ),
            ),
            Center(
                child: Column(
              children: [
                Text("3", style: TextStyle(fontSize: 40, color: Colors.amber)),
                Icon(Icons.access_alarms)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
