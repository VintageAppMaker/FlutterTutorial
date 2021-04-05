### RadioListTile, DropDownButton 위젯 
> 위젯의 사용법 정리

- [전체소스](../../lib/basic/RadioDropdownExample.dart)
- [dartpad로 실행하기](https://dartpad.dev/e9ea2f65aecfa85f65816dd783c48784?null_safety=false)

![](../images/RadioDropdownExample.jpg)

- RadioListTile 위젯은 Radio를 구현하는 위젯이다. 
- **value**에 true/false를 지정한다. 
- 변경시, onChanged에 (value){}의 함수를 정의한다. vaule 값으로 선택된 상태를 관리한다. 

~~~dart
  ...
  
  RadioListTile(
    title: Text("등록"),
    value: true,
    groupValue: isRegister,
    onChanged: (value) {
      setState(() {
        isRegister = value;
      });
    },
  )

  ...
  
~~~

- DropdownButton 위젯은 Dropdown을 구현하는 위젯이다. 
- value에 표시될 문자열을 binding 한다. 
- items에 List로 항목을 지정한다. 
- onChanged에 (value){}의 함수를 정의한다. vaule 값으로 선택된 상태를 관리한다. 

~~~dart
  ...

  DropdownButton(
    value: _selectedSNS,
    items: _dropList,
    onChanged: (value) {
      setState(() {
        _selectedSNS = value;
    });
  }),
  
  ...
~~~