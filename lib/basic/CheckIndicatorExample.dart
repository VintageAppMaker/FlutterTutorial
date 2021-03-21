import 'package:flutter/material.dart';

class CheckIndicatorExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckIndicatorState();
  }
}

class _CheckIndicatorState extends State<CheckIndicatorExample> {
  final String sTitle = "12. CheckBox & Indicator 사용법";

  bool _isChecked = false;
  bool _isChecked2 = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( title : sTitle, home:Scaffold(appBar: AppBar(title: Text(sTitle)), body: buildPage()));
  }

  Widget buildPage() {
    return Center(
      child: Column(
        children: [
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('check1'),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
          ),
          Row(
            children: [
              Checkbox(
                value: _isChecked2,
                onChanged: (value) {
                  setState(() {
                    _isChecked2 = !_isChecked2;
                  });
                },
              ),
              Text("check2")
            ],
          ),

          // 간격 띄우기
          SizedBox(
            height: 30,
          ),

          Container(
            width: 300,
            height: 10,
            child: LinearProgressIndicator(
              value: 0.5,
            ),
          ),

          // 간격 띄우기
          SizedBox(
            height: 30,
          ),

          Container(
            width: 130,
            height: 130,
            child: CircularProgressIndicator(
              value: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
