import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "6. Layout 사용법";
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: buildTestBody()));
  }

  Widget buildTestBody() {
    return Builder(builder: buildBuilderWidget);
  }

  Widget buildBuilderWidget(context) => SingleChildScrollView(child:
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      // layout 예제
      buildCenterColumn(),
      buildCenterRow(),
      buildSizedBox(),
  
      Divider(color: Colors.black),
      buildRow(),
      buildCenter(),
  
      Divider(color: Colors.black),
      buildInVisibleVisible(),
  
      Divider(color: Colors.black),
      buildSpacerAndClipShape(),
  
      Divider(color: Colors.black),
      buildTransForm(context)
  
    ],
  )
  );

  Center buildSpacerAndClipShape() {
    return Center(
          child: Column(
            children: <Widget>[
              Row(children: [buildClipRectCenter(), Spacer(),  buildClipRectRight(), Spacer(),  buildBoxDeco(), Spacer()]),
              Divider(),
              buildClipRect()
            ],
          ),
        );
  }

  Center buildCenter() {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 130,
            height: 130,
            color: Colors.blue,
          ), //Container
          // 위치지정
          Positioned(
              top: 40,
              left: 10,
              child: Container(
                height: 20,
                width: 120,
                color: Colors.amber,
              )), //Container
          Positioned.fill(
              top: -100, left: -10, child: Icon(Icons.access_alarm)),
          Positioned.fill(
              top: 70, left: 60, child: FittedBox(child: FlutterLogo()))
        ], //<Widget>[]
      ), //Stack
    );
  }

  Row buildRow() {
    return Row(children: [
      Expanded(child: Image.asset("assets/images/title.jpg")),
      Expanded(
          flex: 2, child: Text('2배 비율로 공간을 늘립니다', textAlign: TextAlign.center)),
      Expanded(
        child: Icon(Icons.access_alarms),
      )
    ]);
  }

  SizedBox buildSizedBox() {
    return SizedBox(
        width: 100,
        height: 35,
        child: Container(
            width: double.infinity,
            color: Colors.orange,
            child: Text(
              "Sized",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, color: Colors.white),
            )));
  }

  Center buildCenterColumn() {
    return Center(
      child: Container(
          color: Colors.amber,
          width: double.infinity,
          margin: EdgeInsets.all(16),
          child: Column(
            children: [for (int i = 0; i < 10; i++) Text("$i")],
          )),
    );
  }

  Widget buildCenterRow() {
    return Container(
        color: Colors.cyan,
        width: double.infinity,
        margin: EdgeInsets.all(6),
        child: Row(
          children: [for (int i = 0; i < 10; i++) Text("$i")],
        ));
  }

  Widget buildInVisibleVisible(){
    return Center( child: Column(children: [
      Text("opacity: 1.0"),
      Opacity(opacity: 1.0, child: Container(width: 100, height: 100, color: Colors.black)),

      // 공간 할당하고 보이지 않는다.
      Text("opacity: 0.0"),
      Opacity(opacity: 0.0, child: Container(width: 100, height: 100, color: Colors.red)),

      // 공간 할당없이 보이지않는다.
      Text("Visibility: false"),
      Visibility(visible: false, child: Container(width: 100, height: 100, color: Colors.green)),

      // 공간 할당없이 보이지않는다.
      Text("Offstage: false"),
      Offstage( offstage: false, child: Container(width: 100, height: 100, color: Colors.green)),

      Text("Visibility: true"),
      Visibility(visible: true, child: Container(width: 100, height: 100, color: Colors.black)),
    ]));
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
            "https://www.fightersgeneration.com/nf7/char/king-tekken3-frankensteiner-on-lei.gif"),
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

  Widget buildTransForm(BuildContext context) {
    return Transform.translate(
      offset: Offset(-100, -10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: MediaQuery.of(context).size.width*0.3,
        height: MediaQuery.of(context).size.height*0.12,
        child: SizedBox(child:Image.asset( "assets/images/title.jpg"))
      ),
    );
  }
}
