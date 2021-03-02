// 1. java와 같은 비교분기문, 반복문, switch문
//    조건문
//        if(조건){} else if(조건){} else{}
//    반복문
//        for(변수 초기화; 조건; 증가/감소){}
//        for(변수 in 열거가능한 데이터){}
//    switch문
//        switch(변수){case 값: {; break;} ... default:{break;}}
//    do while문
//        do{}while(조건문), while(조건문)

// 2. Null-aware operators : null 방지를 위한 오퍼레이터
//        ?. [object에서 null이 아니면 실행]
//        ?? [기본값에서 null일경우 디폴트값 대입]
//        ??= [object에서 null일경우 디폴트값 대입]

void main() {
  // 1. 조건문
  var nNumber = 2;
  if (nNumber < 2) {
    print("if ${nNumber}");
  } else if (nNumber == 3) {
    print("else if ${nNumber}");
  } else {
    print("else ${nNumber}");
  }
  var bTrue = (10 / 2 > 5) ? true : false;
  print(bTrue);

  // 1. 반복문
  for (var i = 0; i < 10; i++) {
    print(i);
  }

  // 1. switch문
  var nSel = 2;
  switch (nSel) {
    case 1:
      break;
    case 2:
      {
        print("2");
        break;
      }
  }

  // 1. do while문
  var n = 0;
  while (n < 10) {
    print(n);
    n++;
  }

  // 2. null 비교연산자
  var nullVal = null;
  var rst = nullVal ?? 3;
  print("rst가 null이면 = ${rst}");
}
