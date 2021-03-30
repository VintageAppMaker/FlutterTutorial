import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';

class ShareExample extends StatefulWidget {
  @override
  ShareExampleState createState() => ShareExampleState();
}

class ShareExampleState extends State<ShareExample> {
  String _SelectedPath = "";

  @override
  Widget build(BuildContext context) {
    String sTitle ="30. Share 예제";
    return MaterialApp(
      title: sTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
                  Image.file(File(_SelectedPath)),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    onPressed: () async {
                      final imagePicker = ImagePicker();
                      final selectedFile = await imagePicker.getImage(
                        source: ImageSource.gallery,
                      );
                      if (selectedFile != null) {
                        setState(() {
                          _SelectedPath = selectedFile.path;
                          shareImage(context);
                        });
                      }
                    },
                    icon: Icon(Icons.android),
                    label: Text('이미지 공유'),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),

                ],
              )),
            ),
          )),
    );
  }

  shareImage(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    List<String> lst = [];
    lst.add(_SelectedPath);

    // 문자열을 공유한다면
    // Share.share("공유문자열");
    await Share.shareFiles(lst,
        text: "내용",
        subject: "제목",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}