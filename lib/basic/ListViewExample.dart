import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "7. ListView 사용법";
    var lst = List<String>.generate(100, (index) => "$index ");
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: buildTestBody(lst)));
  }

  Widget buildTestBody(List<String> lst) {
    return Column(
      children: [
        Text("주의", style: TextStyle(fontSize: 30)),
        Text("Colimn내 사용시 Expanded 안에 ListView를 추가",
            style: TextStyle(color: Colors.red, fontSize: 10)),
        Divider(),
        Expanded(child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
            child: buildListItem(lst, index),
            onTap: () {
              showSnackBar(context, "${lst[index]}을 선택했습니다.");
            },
          );
        }))
      ],
    );
  }

  Widget buildListItem(List<String> lst, int index) {
    return ListTile(
      title: Text(lst[index]),
      subtitle: Text(
        "${lst[index]} 리스트 항목입니다.",
        style: TextStyle(fontSize: 10),
      ),
      trailing: Icon(Icons.adb),
    );
  }

  void showSnackBar(BuildContext ctx, String s) {
    Scaffold.of(ctx).showSnackBar(SnackBar(content: Text(s)));
  }
}
