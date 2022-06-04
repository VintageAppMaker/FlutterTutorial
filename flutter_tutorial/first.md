### Flutter 설치 및 프로젝트 만들기
> Flutter의 설치 및 프로젝트 만들기


1. Flutter 설치
    - [공식페이지 - Flutter download](https://flutter.dev/docs/get-started/install)
    - [Android Studio 설치](https://developer.android.com/studio)
        - Android Virtual Device 설치(에뮬레이터 만들기)
    - 환경변수 설정
       ~~~
       {설치한 경로}\flutter\bin
       ~~~
    - 콘솔화면에서 flutter doctor 실행   

        ~~~
        C:\flutter_example\FlutterTutorial\flutter_tutorial>flutter doctor
        ╔════════════════════════════════════════════════════════════════════════════╗
        ║ A new version of Flutter is available!                                     ║
        ║                                                                            ║
        ║ To update to the latest version, run "flutter upgrade".                    ║
        ╚════════════════════════════════════════════════════════════════════════════╝


        Doctor summary (to see all details, run flutter doctor -v):
        [√] Flutter (Channel stable, 1.22.6, on Microsoft Windows [Version 10.0.19041.804], locale ko-KR)
        [!] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
            X Android license status unknown.
            Run `flutter doctor --android-licenses` to accept the SDK licenses.
            See https://flutter.dev/docs/get-started/install/windows#android-setup for more details.
        [!] Android Studio (version 4.1.0)
            X Flutter plugin not installed; this adds Flutter specific functionality.
            X Dart plugin not installed; this adds Dart specific functionality.
        [√] VS Code (version 1.54.1)
        [!] Connected device
            ! No devices available

        ! Doctor found issues in 3 categories.

        ~~~
        위의 결과는 VSCode로 개발하는 환경임. Android Studio에서는 AVD(Android Virtual Device)로 불리는 에뮬레이터가 설치되어 있어야 개발가능함.
         


2. Flutter 프로젝트 만들기 및 실행
    - Android Studio는 Plugin을 설치했다면 Android 개발시 일반 Project 생성과 동일함
    - VSCode로 개발 시에는 
        - console에서  
        ~~~
        1. flutter create 프로젝트명 
        2. cd 프로젝트명
        3. code .
        4. lib/main.dart 선택
        5. 우클릭 -> Run without Debugging 또는 Start Debugging을 선택하여 실행
        ~~~

    - flutter pub get 또는 flutter packages get을 하면 pubspec.yml에 정의된 의존성을 설치. vscode에서는 최초실행시 GUI에서 자동으로 설치할 것인지 물어봄.
    


3. 중요한 폴더 및 파일
    - lib/main.dart는 메인함수가 있는 파일(**여기를 선택하고 실행해야 함**)
    - pubspec.yml은 dependancy와 리소스관련 정보가 저장된 파일(gradle과 같은 역할)
        - yaml 형식으로 들여쓰기로 구조화 되어있음
        - android의 AndroidManifest.xml만큼 중요한 파일임

    - iOS는 xcode에서 읽어서 컴파일 할 수 있는 프로젝트
    - android는 Android Studio에서 읽어서 컴파일 할 수 있는 프로젝트

4. 미리 알아두어야 할 중요한 잡지식
    - 프론트엔드 개발자 사고방식으로 개발해야 한다.
    - 구조상 들여쓰기와 괄호에 엄청난 스트레스를 받게된다. 다행히 개발툴들이 보조기능을 지원해준다.
    - 백그라운드 지원안한다(백그라운드 구현하려면 네이티브 코드와 채널로 연결해야 한다)
    - widget으로 구성된 화면을 만드는 작업이 핵심이다.
    - iOS(Cupertino)와 Android(Material) Widget이 따로존재한다.
    - 결국 **iOS에서는 심사를 위해서라도 UI 재구성**을 해야한다.
    - Widget을 변수로 정의하고 사용하는 구조가 아니라 **바인딩**하는 구조이다.
    - 그러므로 선언된 객체의 메소드와 프로퍼티로 화면을 바꾸겠다는 생각을 접는 것이 좋다(바인딩된 변수값이 변하면 연결된 화면도 변함).
    - Native 기능의 많은 부분을 플러그인으로 해결해야햔다(플러터는 멀트플랫폼 UI 엔진임을 잊어서는 안된다).
    - 플러그인끼리 종종 충돌한다(SDK 버전호환성). 결국 Channel로 Native 코드(iOS, Android)를 만들어 통신하는 것이 속편할 때가 있다.
    - 플러터로 제약없는 앱을 만들고자 한다면 결국, Native Project(iOS, Android)를 개발할 수 밖에 없다
    - 플러그인 정보는 [pub.dev](https://pub.dev)이 답이다.
    - [위젯예제](https://flutter-widget.live/basics/introduction)


5. 개발환경 참고사항
    - flutter run -d chrome --web-renderer html 를 해야 Web에서 외부네트워크를 이용한 이미지 로딩 시 에러가 발생하지 않는다.  
    - flutter 2.X대부터 공식적으로 웹 퍼블리싱 가능하다(빌드시 웹으로 연결). 