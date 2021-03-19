import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {
  final String sTitle = "10. Drawer 사용법";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sTitle)),
      body: buildMainPage(),
      // 드로워(서랍) 추가
      drawer: buildDrawer(context),
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
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('상세화면'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Center buildMainPage() => Center(child: Text('My Page!'));
}
