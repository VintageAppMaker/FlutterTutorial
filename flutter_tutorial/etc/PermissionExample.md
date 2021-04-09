### Permission
> Flutter에서 Android Permission 적용하기

- [전체소스](../../lib/advance/PermissionExample.dart)
- [dartpad로 실행하기](#) - Dartpad 지원안함


- pubspec.yaml에 permission_handler: ^3.2.2 추가
- (Android 개발환경) android/app/main/AndroidManifest.xml에 적용하고자 하는 퍼미션을 반드시 기술해야 한다.
- 비동기 함수를 사용한다.
- 퍼미션 채크는 PermissionHandler의 checkPermissionStatus()에 PermissionGroup을 넘긴다.

~~~dart
  void checkPermissionResult(PermissionGroup perm) {
    Future<PermissionStatus> status =
    PermissionHandler().checkPermissionStatus(perm);
    status.then((PermissionStatus status) {
      if ( status != PermissionStatus.granted) return;
      setState(() {
        sResult = "인증되었습니다";
      });
    });
  }
  
  ...
  
  void processPermission() async{
    await requestPermission([PermissionGroup.phone]);
    await checkPermissionResult(PermissionGroup.phone);
  }
    
~~~

- 퍼미션 요청은 PermissionHandler의 requestPermissions()에 PermissionGroup을 넘긴다.

~~~ dart

  Future requestPermission(List <PermissionGroup> perm) async {
    await PermissionHandler().requestPermissions(perm);
  }
  
  ...
  
  void processPermission() async{
    await requestPermission([PermissionGroup.phone]);
    await checkPermissionResult(PermissionGroup.phone);
  }
  
~~~
