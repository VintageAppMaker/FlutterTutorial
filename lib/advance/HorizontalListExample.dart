import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class HorizontalListExample extends StatefulWidget {
  @override
  _HorizontalListExampleState createState() => new _HorizontalListExampleState();
}

class _HorizontalListExampleState extends State<HorizontalListExample> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _index = 0;
    return Scaffold(
      appBar: AppBar(
        title: new Text("25. HorizontalList 예제"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: 30,
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.98,
                child: Card(
                  color: Color.fromARGB(0xff, 0xFA, 0xFF, 0xFA),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column( children: [
                    SizedBox (width: double.infinity, child: ClipRRect(borderRadius: BorderRadius.vertical(top: Radius.circular(10)), child: Container(color: Colors.red, child: Text("Head Info", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),)))),
                    SizedBox(height: 20),
                    Expanded(flex: 2, child: Container (child: Center(child:
                      ClipRRect(child: Image.asset("assets/images/title.jpg"), borderRadius: BorderRadius.all(
                          Radius.circular(25)))
                    ))),
                    SizedBox(height: 20),
                    Expanded(flex: 1, child: Container (child: Text("$i", style: TextStyle(fontSize: 20, color: Colors.grey),))),
                  ],
                  ),
                ),
              );
            },
          ),
        ),
      )
    );
  }


}