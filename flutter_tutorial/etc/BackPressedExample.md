### WillPopScope
> Flutter에서 디바이스의 backkey를 제어한다.

- [원본소스](../../lib/advance/BackPressedExample.dart)
- [dartpad로 실행하기](#) - Dartpad에서 실행안됨

- WillPopScope안의 child에 메인위젯을 넘긴다.
- onWillPop에 backkey를 눌렀을 경우, Future<bool> ()형의 함수를 넘긴다.
  - true이면 종료. false이면 backkey를 무시한다.

~~~dart
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
         ...
      ),
      onWillPop: onBackPressedHanlder,
    );
  }

  ...
  
  Future<bool> onBackPressedHanlder() {
    return ...;
  }
~~~
