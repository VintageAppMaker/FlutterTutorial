import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin audio player'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(children: [buildClipRectCenter(), Spacer(),  buildClipRectRight(), Spacer(),  buildBoxDeco(), Spacer()]),
              Divider(),
              buildClipRect()
            ],
          ),
        ),
      ),
    );
  }

  ClipRect buildClipRect() {
    return ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                widthFactor: 0.75,
                heightFactor: 0.75,
                child: SizedBox(width: 150, height: 150, child: Image.network(
                    "https://miro.medium.com/max/1600/1*-e5Hl_0novHiOgPNVXzNLw.gif"),),
              ),
            );
  }

  Widget buildClipRectCenter() {
    return Container(width: 80, height: 80, child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Align(
        alignment: Alignment.topCenter,
        widthFactor: 1,
        heightFactor: 1,
        child: Image.network(
            "https://miro.medium.com/max/1600/1*-e5Hl_0novHiOgPNVXzNLw.gif"),
      ),
    ),);
  }

  Widget buildClipRectRight() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.0),
      child: Container(color: Colors.amber, width: 100, height:100 , child: Align(
          alignment: Alignment.bottomRight,
          widthFactor: 1,
          heightFactor: 1,
          child: Container(margin: EdgeInsets.only(left: 0.0, bottom: 10.5, right: 10.5),  child: Text("❤"),)
      ),),
    );
  }

  Widget buildBoxDeco() {
    return Container(
      height: 50,
      width: 100,
      decoration: new BoxDecoration(
        color: Colors.orangeAccent,
        border: Border.all(color: Colors.red, width: 0.0),
        borderRadius: new BorderRadius.all(Radius.elliptical(50, 50)),
      ),
      child: Align(alignment: Alignment.center, child: Text('Box')),
    );
  }
}
