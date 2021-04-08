### StaggeredGridView
> Flutter에서 크기가 다른 GridView를 사용하기

- [전체소스](../../lib/advance/StaggeredGridViewExample.dart)
- [dartpad로 실행하기](#) - Dartpad 지원안함

![](../images/StaggeredExample.jpg)

- pubspec.yaml에서 flutter_staggered_grid_view: ^0.3.4 추가
- StaggeredGridView 위젯의 countBuilder에서 화면을 구성한다.
  - crossAxisCount는 가로로 보여줄 item의 갯수이다.
  - crossAxisSpacing, mainAxisSpacing는 Item간의 간격이다.
  - itemCount는 보여줄 Item의 갯수이다.
  - itemBuilder는 (context, index) { returnb 위젯}형의 함수로 Item 화면을 그린다.

~~~ dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class StaggeredExample extends StatefulWidget {
  @override
  _StaggeredExampleState createState() => new _StaggeredExampleState();
}

class _StaggeredExampleState extends State<StaggeredExample> {
  List<String> imageList = [
    'https://mms.businesswire.com/media/20140725005162/en/425444/5/SS1.jpg',
    'https://i.ytimg.com/vi/2dzBRk2O9S4/hqdefault.jpg',
    'https://yt3.ggpht.com/ytc/AAUvwni2LybZu5VFVrETJiU1q2QrcSMH75areqCPrghzOw=s900-c-k-c0x00ffffff-no-rj',
    'https://cdn.aitimes.kr/news/photo/202007/17018_18480_4817.jpg',
    'https://media2.giphy.com/media/uG39DjzqYui3IL2QZe/giphy.gif?cid=ecf05e47e56qov8ps7epcvacdw718h5fz5yidw8xilfk9osc&rid=giphy.gif',
    'https://mms.businesswire.com/media/20140725005162/en/425444/5/SS1.jpg',
    'https://i.ytimg.com/vi/2dzBRk2O9S4/hqdefault.jpg',
    'https://media2.giphy.com/media/uG39DjzqYui3IL2QZe/giphy.gif?cid=ecf05e47e56qov8ps7epcvacdw718h5fz5yidw8xilfk9osc&rid=giphy.gif',
    'https://yt3.ggpht.com/ytc/AAUvwni2LybZu5VFVrETJiU1q2QrcSMH75areqCPrghzOw=s900-c-k-c0x00ffffff-no-rj',
    'https://cdn.aitimes.kr/news/photo/202007/17018_18480_4817.jpg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("24. RefreshIndicator 예제"),
      ),
      body: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                      Radius.circular(5))
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(5)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageList[index],fit: BoxFit.cover,),
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1 : 1.8);
          }),
    );
  }


}
~~~
