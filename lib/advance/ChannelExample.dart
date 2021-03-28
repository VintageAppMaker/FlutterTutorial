import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelExample extends StatefulWidget {
  @override
  ChannelExampleState createState() => ChannelExampleState();
}

class ChannelExampleState extends State<ChannelExample> {
  var platform = MethodChannel("com.psw.dev/test");

  @override
  Widget build(BuildContext context) {
    String sTitle ="31. channel 테스트";
    String sMessage = "from Android:";
    return MaterialApp(
      title: sTitle,
      home: Scaffold(
          appBar: AppBar(
            title: Text(sTitle),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 22.0)),
                  buildSnackBarBuilder(),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),

                ],
              )),
            ),
          )),
    );
  }

  Builder buildSnackBarBuilder() {
    // Context를 얻기위해 Builder로 감싼다.
    return Builder(builder: (BuildContext context) {
      return FloatingActionButton.extended(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: ()  {
          getTest(context);
        },
        icon: Icon(Icons.android),
        label: Text("Android channel"),
      );
    });
  }

  void showSnackBar(BuildContext ctx, String s) {
    Scaffold.of(ctx).showSnackBar(SnackBar(content: Text(s)));
  }

  void getTest(BuildContext ctx) async {
    var s = await platform.invokeMethod("getTest");
    print(s);
    showSnackBar(ctx, s);
  }

}