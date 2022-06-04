import 'dart:ui';

import 'package:FlutterTutorial/advance/HorizontalListExample.dart';
import 'package:FlutterTutorial/advance/RefreshIndicatorExample.dart';
import 'package:FlutterTutorial/advance/StaggeredGridViewExample.dart';
import 'package:FlutterTutorial/io/AssetReadExample.dart';
import 'package:FlutterTutorial/io/HTMLParserExample.dart';
import 'package:FlutterTutorial/route.dart';
import 'package:FlutterTutorial/statemanagement/StreamBuilderExample.dart';
import 'package:flutter/material.dart';
import 'advance/BackPressedExample.dart';
import 'advance/ChannelExample.dart';
import 'advance/PageViewExample.dart';
import 'advance/PermissionExample.dart';
import 'advance/ShareExample.dart';
import 'advance/SliverExample.dart';
import 'advance/ThemeExample.dart';
import 'advance/WebViewExample.dart';
import 'statemanagement/KeyExample.dart';
import "io/FileIOExample.dart";
import 'io/HttpJsonExample.dart';
import 'io/HttpSimple.dart';
import "io/PrefExample.dart";
import 'package:flutter/services.dart';
import 'statemanagement/ProviderExample.dart';

import 'statemanagement/InheritedWidgetExample.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 전체화면 만들기
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      scrollBehavior: DeskScrollBehavior(),
      debugShowCheckedModeBanner: false,
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
  MainPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: buildMain(context)));
  }

  void shareUrl(String sUrl) async {
    final Uri _url = Uri.parse(sUrl);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  Center buildMain(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildHeaderBanner("먼저", "😀", "github", "소스와 문서", backcolor: Color(
              0xff383838)),
          buildGithubItem("https://github.com/VintageAppMaker/FlutterTutorial",  "repository", "예제의 소스와 문서가 있는 곳."),
          buildHeaderBanner("basic", "1", "기본위젯", "빈번하게 사용되는 위젯과 기초지식"),
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
              "Checked, ProgressIndicator 사용법을 정리합니다."),
          buildContentItem(context, "/DialogSnackBarExample",
              "13. Dialog, SnackBar 예제", "Dialog, SnackBar 사용법을 정리합니다."),
          buildContentItem(context, "/CupertinoExample", "14. Cupertino 예제",
              "Cupertino 사용법을 정리합니다."),
          buildHeaderBanner(
              "Utility", "2", "File, Pref, Network", "파일관리 및 네트워크 예제"),
          buildContentItem2(context, FileIOExample(storage: FileHelper()),
              "15. File I/O 예제", "File Read/Write를 정리합니다."),
          buildContentItem2(context, PrefExample(), "16. Preference 예제",
              "Preference를 정리합니다."),
          buildContentItem2(
             context, AssetReadExample(), "17. Asset 예제", "Asset 파일을 읽기."),
          buildContentItem2(context, HttpSimpleExample(), "18. HTTP, JSON 예제 1",
              "간단한 플러터 공식예제(pub.dev) 1"),
          buildContentItem2(context, HttpJsonExample(), "19. HTTP, JSON 예제 2",
              "json 배열처리 플러터 공식예제(pub.dev) 2"),
          buildContentItem2(
              context, HTMLParserExample(), "20. HTMLParser 예제", "html 파싱"),
          buildHeaderBanner("state", "3", "상태관리", "key, Stream, Provider 활용"),
          buildContentItem2(
              context, KeyExample(), "21. Key 예제", "key에 대한 기초예제"),
          buildContentItem2(context, InWidgetExample(),
              "22. InheritedWidget 예제", "하위 위젯에게 전역적인 값을 제공"),
          buildContentItem2(context, ProviderExample(), "23. Provider 예제",
              "InheritedWidget보다 쉽고 강력해진 기능"),
          buildContentItem2(context, StreamBuilderExample(),
              "24. StreamBuilder & HTTP 예제", "StreamBuilder를 이용한 비동기통신 "),
          buildHeaderBanner("etc", "4", "기타", "기타 위젯 및 기능"),
          buildContentItem2(context, RefreshIndicatorExample(),
              "25. RefreshIndicator 예제", "화면을 pulldown하여 리스트 갱신"),
          buildContentItem2(context, StaggeredExample(),
              "26. Staggered Gridview 예제", "Staggered Gridview 사용법"),
          buildContentItem2(context, HorizontalListExample(),
              "27. Horizontal List 예제", "Horizontal List 사용법"),
          buildContentItem2(
              context, SliverExample(), "28. Sliver 예제", "Sliver 사용법"),
          buildContentItem2(context, PermissionExample(), "29. Permission 예제",
              "Native인 Android 소스수정이 필요"),
          buildContentItem2(
              context, ShareExample(), "30. Share 예제", "Share 기능설명"),
          buildContentItem2(
              context, ChannelExample(), "31. Channel 예제", "Native와 통신"),
          buildContentItem2(
              context, ThemeExample(), "32. Theme 예제", "Native와 통신"),
          buildContentItem2(
              context, PageViewExample(), "33. PageView 예제", "PageView 예제"),
          buildContentItem2(context, WebViewExample(), "34. WebView 예제",
              "WebView 공식예제(pub.dev)"),
          buildContentItem2(context, BackPressedExample(), "35. BackPressed 예제",
              "BackPressed 기능설명")
        ],
      ),
    );
  }

  Widget buildGithubItem(
      String sDestination, String sTitle, String sDesc) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            child: ListTile(
              title: Text(sTitle),
              subtitle: Text(
                sDesc,
                style: TextStyle(fontSize: 10),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          onTap: () {
            shareUrl(sDestination);
          },
        ),
        Divider()
      ],
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

  // Material 위젯에서 직접 이동
  Widget buildContentItem2(
      BuildContext context, Widget sDestination, String sTitle, String sDesc) {
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
            Navigator.push(
              context,
              // Navigator.pop(context)으로 back
              MaterialPageRoute(builder: (context) => sDestination),
            );
          },
        ),
        Divider()
      ],
    );
  }

  Widget buildHeaderBanner(
      String sBanner, String sNumber, String sTitle, String sSubTitle, {Color backcolor = Colors.red}) {
    return Banner(
      message: sBanner,
      textStyle: TextStyle(color: backcolor),
      location: BannerLocation.bottomStart,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        child: Card(
          color: backcolor,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1, child: SizedBox(width: double.infinity)),
                      SizedBox(
                        height: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('$sNumber'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      sTitle,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Color.fromRGBO(0xFF, 0xFF, 0xFF, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.bold), //TextStyle
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      sSubTitle,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Color.fromRGBO(0xFF, 0xFF, 0xF3, 0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold), //TextStyle
                    ),
                  ), //Text
                  SizedBox(height: 10),
                ], //<Widget>[]
              )), //Column
        ), //Padding
      ), //Container
    );
  }
}

// 웹과 desktop에서 모바일처럼 터치 스크롤 지원하기 위함
class DeskScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
