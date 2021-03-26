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