import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogSnackBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "13. Dialog, SnackBar 사용법";
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: buildTestBody(context)));
  }

  Widget buildTestBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[buildSnackBarBuilder(), buildFlatButton()],
    );
  }

  Widget buildFlatButton() {
    // Context를 얻기위해 Builder로 감싼다.
    return Builder(builder: (BuildContext context) {
      return FlatButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text('AlertDialog'));
    });
  }

  Builder buildSnackBarBuilder() {
    // Context를 얻기위해 Builder로 감싼다.
    return Builder(builder: (BuildContext context) {
      return FlatButton(
          onPressed: () {
            showSnackBar(context, "Hi");
          },
          child: Text('SnackBar'));
    });
  }

  void showSnackBar(BuildContext ctx, String s) {
    Scaffold.of(ctx).showSnackBar(SnackBar(content: Text(s)));
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: new Text("타이틀"),
          content: Text("본문"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
