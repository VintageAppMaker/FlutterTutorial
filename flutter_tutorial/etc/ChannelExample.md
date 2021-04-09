### Channel
> Flutter에서 각 환경(iOS, Android, Desktop)의 Native 기능을 사용하려면 channel 프로그래밍을 통해 통신할 수 있다.

- [전체소스](../../lib/advance/ChannelExample.dart)
- [Android 소스](../../android/app/src/main/kotlin/com/example/FlutterTutorial/MainActivity.kt)
- [dartpad로 실행하기](#) - Dartpad 지원안함

- Android와 통신을 위해서 channel을 사용한다.
- 비동기 함수를 사용한다.
- Android Studio에서 프로젝트의 Android 폴더를 선택하여 프로젝트를 연다.
- ../../android/app/src/main/kotlin/com/example/FlutterTutorial/MainActivity.kt의 파일에서 channel을 구현한다.
  - MethodChannel()로 객체를 생성한다. 파라메터로 문자열을 넘긴다(CHANNEL ="com.psw.dev/test).
  - 생성된 객체의 setMethodCallHandler 메소드를 구현한다. dart에서 channel로 등록된 함수를 호출했을 때, 처리하는 메소드이다.
    - call, result를 파라메터로 받는다.
    - call.method로 호출한 함수명을 비교한다.
    - result.success(리턴값)을 통해 값을 리턴한다.
  - 코틀린에서 dart(flutter) 함수를 호출하고자 한다면, MethodChannel로 선언된 객체의 invokeMethod(함수명, 파라메터)를 통해 호출할 수 있다.

~~~kotlin
  
package com.example.FlutterTutorial
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


// configureFlutterEngine를 오버라이드 하는 곳에서만
// 문제없이 빌드가 됨. 버전 업그레이드를 하면서
// GeneratedPluginRegistrant는 설정이 어려움
private val CHANNEL ="com.psw.dev/test"
class MainActivity: FlutterActivity() {
    var channel : MethodChannel? = null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel?.setMethodCallHandler { call, result ->
            methoProcess(call, result)
        }
    }

    private fun methoProcess(call: MethodCall, result: MethodChannel.Result) {
        when(call.method){
            "getString" -> {
                result.success("Android에서 문자열을 반환")
            }

            "startCallback" -> {
                callbackFired()
            }
        }
    }

    fun callbackFired() {
        channel!!.invokeMethod("callbackString", "callback을 호출하고 문자열을 넘김")
    }
}

    
~~~

- Flutter에서 channel을 사용하려면 MethodChannel(문자열)을 통해 객체를 생성한다.
- Native에 정의된 함수를 호출하려면 invokeMethod(함수명, 파라메터) 메소드를 사용한
- Native에서 flutter 함수를 호출할 수 있게 setMethodCallHandler() 함수를 구현한다. Future<dynamic> (MethodCall call) 형이다. 그러므로 리턴값으로 native에 값을 전달할 수도 있다.

~~~ dart
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

        _scaffoldKey.currentState.showSnackBar(SnackBar(
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
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(s),
      duration: Duration(seconds: 3),
    ));

    await platform.invokeMethod("startCallback");
  }

}
~~~
