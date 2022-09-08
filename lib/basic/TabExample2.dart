import 'package:flutter/material.dart';

class TabExample2 extends StatelessWidget {
  const TabExample2({Key? key}) : super(key: key);

  static const tabViewes = <Center>[
    Center(child: Text("1", style: TextStyle(fontSize: 30))),
    Center(child: Text("2", style: TextStyle(fontSize: 30))),
    Center(child: Text("3", style: TextStyle(fontSize: 30))),
    Center(child: Text("4", style: TextStyle(fontSize: 30)))
  ];

  @override
  Widget build(BuildContext context) {
    String sTitle = "9. tab 사용법2";
    return MaterialApp(
        title: sTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(sTitle),
            ),
            body: buildDefaultTabController()));
  }

  DefaultTabController buildDefaultTabController() {
    return DefaultTabController(
      length: tabViewes.length,
      child: Builder(
        // callback으로 호출될 때 그린다.
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TabPageSelector(),
              Expanded(
                child: TabBarView(children: tabViewes),
              ),
              TextButton(
                child: Text('끝으로 이동'),
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context)!;
                  if (!controller.indexIsChanging) {
                    controller.animateTo(tabViewes.length - 1);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
