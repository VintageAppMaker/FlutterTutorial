import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelExample extends StatefulWidget {
  @override
  ChannelExampleState createState() => ChannelExampleState();
}

class ChannelExampleState extends State<ChannelExample> {
  var platform = MethodChannel("com.psw.dev/test");
  String sTitle ="31. channel 테스트";

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    platform.setMethodCallHandler(callbackHandler);
    super.initState();
  }

  Future<dynamic> callbackHandler(MethodCall call) async {
    switch (call.method) {
      case "callbackString":
        var s = call.arguments;

        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text(s),
          duration: Duration(seconds: 3),
        ));
        

        break;
      default:
        throw ("method not defined");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          key: _scaffoldKey,
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
          doCallAPI(context);
        },
        icon: Icon(Icons.android),
        label: Text("Android와 통신"),
      );
    });
  }


  void doCallAPI(BuildContext ctx) async {
    var s = await platform.invokeMethod("getString");
    print(s);
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(s),
      duration: Duration(seconds: 3),
    ));

    await platform.invokeMethod("startCallback");
  }

}