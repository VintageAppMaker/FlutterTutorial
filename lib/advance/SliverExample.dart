import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  SliverExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = '28. Sliver Example';

    return MaterialApp(
      title: title,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // Provide a standard title.
              title: Text(title),
              floating: true,
              flexibleSpace: Image.asset(
                  "assets/images/title.jpg", fit: BoxFit.cover),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('$index')),
                childCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}