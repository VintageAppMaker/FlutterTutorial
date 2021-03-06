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

3. 중요한 폴더 및 파일
    - lib/main.dart는 메인함수가 있는 파일(**여기를 선택하고 실행해야 함**)
    - pubspec.yml은 dependancy와 리소스관련 정보가 저장된 파일(gradle과 같은 역할)
        - yaml 형식으로 들여쓰기로 구조화 되어있음
        - android의 AndroidManifest.xml만큼 중요한 파일임

    - iOS는 xcode에서 읽어서 컴파일 할 수 있는 프로젝트
    - android는 Android Studio에서 읽어서 컴파일 할 수 있는 프로젝트