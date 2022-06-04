import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// 1. AndroidManifest.xml에 퍼미션 추가 필수
// 2. 플러그인 추가 => permission_handler: ^3.2.2

//* null safety 적용이후, 플러그인 구조가 변경됨.

class PermissionExample extends StatefulWidget {
  @override
  PermissionExampleState createState() => PermissionExampleState();
}

class PermissionExampleState extends State<PermissionExample> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
  }

  Future<void> checkPermissionResult(Permission permission) async {
    final status = await permission.request();

    setState(() {
      _permissionStatus = status;

    });
  }

  Future requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      _permissionStatus = status;
    });
  }

  void processPermission() async {
    await requestPermission(Permission.phone);
    await checkPermissionResult(Permission.phone);
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  _permissionStatus.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    processPermission();
                  },
                  icon: Icon(Icons.android),
                  label: Text('퍼미션 채크'),
                )
              ],
            ),
          )),
        ));
  }
}
