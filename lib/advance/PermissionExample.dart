import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// 1. AndroidManifest.xml에 퍼미션 추가 필수
// 2. 플러그인 추가 => permission_handler: ^3.2.2
class PermissionExample extends StatefulWidget {
  @override
  PermissionExampleState createState() => PermissionExampleState();
}

class PermissionExampleState extends State<PermissionExample> {
  String sResult = "결과";

  @override
  void initState() {
    super.initState();
  }

  void checkPermissionResult(PermissionGroup perm) {
    Future<PermissionStatus> status =
    PermissionHandler().checkPermissionStatus(perm);
    status.then((PermissionStatus status) {
      if ( status != PermissionStatus.granted) return;
      setState(() {
        sResult = "인증되었습니다";
      });
    });
  }

  Future requestPermission(List <PermissionGroup> perm) async {
    await PermissionHandler().requestPermissions(perm);
  }

  void processPermission() async{
    await requestPermission([PermissionGroup.phone]);
    await checkPermissionResult(PermissionGroup.phone);
  }

  @override
  Widget build(BuildContext context) {
    final String sTitle = "29. Permission 예제";
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: sTitle,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(sTitle),
          ),
          body: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(sResult, style: TextStyle(fontSize: 30, color: Colors.red),),
                    SizedBox(height: 20,),
                    FloatingActionButton.extended(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        processPermission();
                      },
                      icon: Icon(Icons.android),
                      label: Text('퍼미션 채크'),
                    )],
                ),
              )
          ),
        )
    );
  }
}