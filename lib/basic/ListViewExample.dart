import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sTitle = "7. ListView 사용법";
    var lst = List<String>.generate(101, (index) => "$index ");
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
        Text("Header", style: TextStyle(fontSize: 30)),
        Text("Column내 사용시 Expanded 안에 ListView를 추가",
            style: TextStyle(color: Colors.red, fontSize: 10)),
        Divider(),
        Expanded(
            child: ListView.separated(
                //ListView.builder를 사용하면 세퍼레이터(구분선)를 설정하지 않아도된다.
                itemCount: lst.length,
                separatorBuilder: (context, index) {
                  // 항목에 따라 안보여줄 수도 있다.
                  if (index == 0) return SizedBox.shrink();
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: buildListItem(lst, index),
                    onTap: () {
                      showSnackBar(context, "${lst[index]}을 선택했습니다.");
                    },
                  );
                })),
        Divider(),
        Text("Footer", style: TextStyle(fontSize: 30)),
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
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(s)));
  }
}
