import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

// 구글공식문서
// https://flutter.dev/docs/development/ui/widgets/cupertino

// iOS와 Android의 디자인을 혼용하여 사용하다보면
// 어디선가 충돌이 발생할 가능성이 높다.
//
class CupertinoExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CupertinoState();
  }
}

class _CupertinoState extends State<CupertinoExample> {
  final String sTitle = "13. Cupertino 사용법";
  TextEditingController _textController;
  bool _lights = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sMessage = "Cupertino 디자인";

    sMessage = checkiOS(context, sMessage);
    _textController = TextEditingController(text: sMessage);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(sTitle),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              CupertinoButton(
                onPressed: () {},
                child: Text("Tap me"),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoTextField(controller: _textController),
              CupertinoSwitch(
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                  });
                },
              ), 
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  String checkiOS(BuildContext context, String sMessage) {
    var platform = Theme.of(context).platform;
    if (platform == TargetPlatform.android) {
      sMessage = 'Android 환경에서 Cupertiono';
    }
    return sMessage;
  }

}
