import 'package:flutter/material.dart';

class RadioDropDownExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RadioDropDownState();
  }
}

class _RadioDropDownState extends State<RadioDropDownExample> {
  final String sTitle = "11. Radio & DropDown 사용법";
  bool isRegister = false;

  // map형 리스트
  final _dropList = [
    DropdownMenuItem(value: "google", child: Text("1. Google")),
    DropdownMenuItem(value: "facebook", child: Text("2. Facebook")),
    DropdownMenuItem(
        value: "email",
        child: Row(
          children: [
            Icon(Icons.email),
            Text(" email"),
          ],
        ))
  ];
  String _selectedSNS = "google";

  @override
  void initState() {
    _selectedSNS = _dropList[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(sTitle)), body: buildPage());
  }

  Widget buildPage() {
    return Center(
      child: Column(
        children: [
          RadioListTile(
            title: Text("등록"),
            value: true,
            groupValue: isRegister,
            onChanged: (value) {
              setState(() {
                isRegister = value;
              });
            },
          ),
          RadioListTile(
            title: Text("미등록"),
            value: false,
            groupValue: isRegister,
            onChanged: (value) {
              setState(() {
                isRegister = value;
              });
            },
          ),
          DropdownButton(
              value: _selectedSNS,
              items: _dropList,
              onChanged: (value) {
                setState(() {
                  _selectedSNS = value;
                });
              }),
          Text("$_selectedSNS를 선택했습니다")
        ],
      ),
    );
  }
}
