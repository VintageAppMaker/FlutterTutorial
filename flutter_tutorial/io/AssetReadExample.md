### Prefernce
> Flutter에서 Asset 읽어오기

- [전체소스](../../lib/io/AssetReadExample.dart)
- [dartpad로 실행하기](#) - DartPad에서 지원안함. 실행안됨.


- rootBundle.loadString을 이용해 에셋에 존재하는 파일에서 문자열을 읽을 수 있다.
~~~dart
  ...
  void _loadString(String sFile) async {
    String text = await rootBundle.loadString(sFile);
    setState(() {
      _str = text;
    });
  }
  ...
  
  _loadString("assets/source/test.txt");
~~~

-asset 파일은 pubspec.yaml에 지정하면 된다.

~~~dart
 assets:
     - assets/source/
~~~