- Refactor = shift + F6
- recently files = ctrl + shift + e / ctrl + e
- Ctrl + f12 = 파일스트럭쳐(모든 메서드를 볼 수 있다)
- Ctrl + h  = 상속관계를 나타냄
- alt + j = 다중문자 선택
- android - help - find action - Regex 클릭하고 - //.*\n (모든 주석과 Enter까지 선택) - Replace All 하면 삭제

- 에뮬레이터 실행 중이 아닌데 실행이 되고 있다면 .lock 파일을 지우면 실행되는것 같다
- /Android/sdk/platform-tools/adb 를 환경변수에 등록하면 adb devices 하면 에뮬레이터 목록을 볼 수 있다.


- flutter create . : 현재 프로젝트에 플러터 프로젝트를 만든다
-                    예전버전이라서 지금과 호환이 안되면
                     .idea을 삭제하고 /
                     그래도 안되면 pubspec.yaml에 dart 버전을 현재 버전으로 바꿔주고
                     Pub outdated : 현재버전과 yaml에 있는 버전을 비교해서 보여준다
                     (flutter pub upgrade major-version)
                     pusbspec.lock : 현재 라이브러리의 실제 버전을 기술 해놓았다
                     에뮬레이터에 이미 설치되어 있다면 삭제를 하고 다시 설치해보자- 