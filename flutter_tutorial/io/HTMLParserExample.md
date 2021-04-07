### HTML
> Flutter에서 HTML 파싱하기

- [전체소스](../../lib/io/HTMLParserExample.dart)
- [dartpad로 실행하기](#) - DartPad에서 지원안함. 실행안됨.

- import 'package:html/parser.dart' as html_parser;로 import
- final document = html_parser.parse(response.body);로 HTML 파싱
- 원하는 DOM을 getElementsByClassName(클래스명)으로 가져올 수 있다.
~~~dart
  ...
  Future getData() async {
    final response =
        await http.get(Uri.https('vintageappmaker.tistory.com','' ) );
    print(response.body);
    final document = html_parser.parse(response.body);

    setState(() {
      lst = document.getElementsByClassName('thumbnail_post');
    });
  }
  ...
  
~~~

- DOM에서 child와 parent를 이용해 원하는 element를 가져오고 제어할 수 있다 .
~~~dart
 return ListTile(
   title: Text(lst[index].parent.children[1].children[0].text ?? " ", style: TextStyle(fontSize: 14)),
   trailing: Image.network("https:" + lst[index].children[0].attributes['src']),
);
~~~