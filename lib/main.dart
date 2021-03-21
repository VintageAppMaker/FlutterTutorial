import 'package:FlutterTutorial/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tutorial"),
        ),
        body: SingleChildScrollView(child: buildCenter(context)));
  }

  Center buildCenter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildContentItem(
              context, "/TextExample", "1. Text 예제", "Text 사용법을 정리합니다."),
          buildContentItem(
              context, "/ButtonExample", "2. Button 예제", "Button 사용법을 정리합니다."),
          buildContentItem(
              context, "/ImageExample", "3. Image 예제", "Image 사용법을 정리합니다."),
          buildContentItem(context, "/TextFieldExample", "4. TextField 예제",
              "TextField 사용법을 정리합니다."),
          buildContentItem(context, "/FormFieldExample", "5. FormField 예제",
              "FormField 사용법을 정리합니다."),
          buildContentItem(
              context, "/LayoutExample", "6. Layout 예제", "Layout 사용법을 정리합니다."),
          buildContentItem(context, "/ListViewExample", "7. ListView 예제",
              "ListView 사용법을 정리합니다."),
          buildContentItem(
              context, "/TabViewExample", "8. Tab 예제", "Tab 사용법을 정리합니다(기본)."),
          buildContentItem(context, "/TabViewExample2", "9. Tab 예제2",
              "Tab 사용법을 정리합니다(Builder 이용)."),
          buildContentItem(
              context, "/DrawerExample", "10. Drawer 예제", "Drawer 사용법을 정리합니다."),
          buildContentItem(context, "/RadioDropDownExample",
              "11. Radio & DropDown 예제", "Radio & DropDown 사용법을 정리합니다."),
          buildContentItem(
              context,
              "/CheckIndicatorExample",
              "12. Checked, ProgressIndicator 예제",
              "Checked, PriogressIndicator 사용법을 정리합니다."),
          buildContentItem(context, "/DialogSnackBarExample",
              "13. Dialog, SnackBar 예제", "Dialog, SnackBar 사용법을 정리합니다."),
          buildContentItem(context, "/CupertinoExample", "14. Cupertino 예제",
              "Cupertino 사용법을 정리합니다."),
          buildContentItem(context, "/SourceViewer", "Test",
              "....")    
        ],
      ),
    );
  }

  Widget buildContentItem(
      BuildContext context, String sDestination, String sTitle, String sDesc) {
    return Column(
      children: [
        GestureDetector(
          child: ListTile(
            title: Text(sTitle),
            subtitle: Text(
              sDesc,
              style: TextStyle(fontSize: 10),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
          onTap: () {
            Navigator.pushNamed(context, sDestination);
          },
        ),
        Divider()
      ],
    );
  }
}
