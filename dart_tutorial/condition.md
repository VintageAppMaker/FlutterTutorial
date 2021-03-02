### condition
> 비교분기, 반복문, switch문에 대해 정리한다.

- [전체소스](condition.dart)
- [dartpad로 실행하기](https://dartpad.dev/20843b8ec4c8832e5f1b2ab680946852)


1. java와 같은 비교분기문, 반복문, switch문
~~~
    조건문
        if(조건){} else if(조건){} else{}
    반복문
        for(변수 초기화; 조건; 증가/감소){}
        for(변수 in 열거가능한 데이터){}
    switch문
        switch(변수){case 값: {; break;} ... default:{break;}}
    do while문
        do{}while(조건문), while(조건문)

    으로 되어있다.     
~~~
2. Null-aware operators : null 방지를 위한 오퍼레이터
~~~
    ?. [object에서 null이 아니면 실행]
    ?? [기본값에서 null일경우 디폴트값 대입]
    ??= [object에서 null일경우 디폴트값 대입]

    최신 프로그래밍 언어는 NPE(Null Pointer Exception)에 대해 강화된 기능을 제공한다.
    그러므로 비교문으로 Null을 채크하는 코드대신 null check 연산자로 단순처리하게 하는 것이 
    추세이다. 
~~~        

~~~dart
  var nullVal = null;
  var rst = nullVal ?? 3;
  print("rst가 null이면 = ${rst}");
~~~