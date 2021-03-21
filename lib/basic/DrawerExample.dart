import 'package:flutter/material.dart';

class DrawerExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerState();
  }
}

class _DrawerState extends State<DrawerExample> {
  final String sTitle = "10. Drawer 사용법";
  int pageSelected = 0;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sTitle,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text(sTitle)),
        body: buildMainPage(),
        drawer: buildDrawer(context),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Image.asset("assets/images/title.jpg",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill),
                ),
                Center(
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                )
              ],
            )),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('홈'),
            onTap: () {
              setState(() {
                pageSelected = 0;
              });

              if (_scaffoldKey.currentState.isDrawerOpen) {
                _scaffoldKey.currentState.openEndDrawer();
              } else {
                _scaffoldKey.currentState.openDrawer();
              }
            },
          ),
          Divider(),
          ListTile(
            title: Text('Google'),
            onTap: () {
              setState(() {
                pageSelected = 1;
              });
              if (_scaffoldKey.currentState.isDrawerOpen) {
                _scaffoldKey.currentState.openEndDrawer();
              } else {
                _scaffoldKey.currentState.openDrawer();
              }
            },
          )
        ],
      ),
    );
  }

  // Drawer 선택시 화면을 만든다.
  Center buildMainPage() {
    var page = Center(child: Text(""));
    switch (pageSelected) {
      case 0:
        page = Center(child: Text("Home 화면"));
        break;
      case 1:
        page = Center(
            child: Image.network(
                "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"));
        break;
      default:
    }

    return page;
  }
}
