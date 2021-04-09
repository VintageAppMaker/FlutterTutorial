### Share
> Flutter에서 Native 공유기능 적용하기

- [전체소스](../../lib/advance/ShareExample.dart)
- [dartpad로 실행하기](#) - Dartpad 지원안함

![](../images/ShareExample.jpg)

- pubspec.yaml에 share: ^2.0.1 추가
- 비동기 함수를 사용한다.
- Share.shareFiles() 함수를 사용하여 공유할 파일과 정보를 지정한다.
- Share.share("공유문자열")로 문자열을 공유할 수 있다.

~~~dart
  
  shareImage(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    List<String> lst = [];
    lst.add(_SelectedPath);

    // 문자열을 공유한다면
    // Share.share("공유문자열");
    await Share.shareFiles(lst,
        text: "내용",
        subject: "제목",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
    
~~~

- 이미지를 디바이스에서 가져오는 예제를 위해 pubspec.yaml에 image_picker: ^0.7.3를 추가한다.
- ImagePicker()를 생성하고 getImage(source: ImageSource.gallery)를 하여 갤러리에서 이미지 정보(주소)를 가져온다.

~~~ dart
 ...
 
  onPressed: () async {
    final imagePicker = ImagePicker();
    final selectedFile 
      = await imagePicker.getImage(
          source: ImageSource.gallery,
    );
    
    if (selectedFile != null) {
      setState(() {
        _SelectedPath = selectedFile.path;
        shareImage(context);
      });
    }
  }
  
 ... 
~~~
