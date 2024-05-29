### Today's git issue
TIL을 작성하고 푸시를 하려는데 무언가 거슬리는 파일을 발견했다.   
범인은 <mark> .DS_Store </mark>


    DS_Store 파일이란?
    애플의 맥 OS X 시스템이 finder로 폴더에 접근할 때 자동으로 생기는 파일로 해당 폴더에 대한 메타데이터를 저장하는 파일 (윈도우의 thumb.db 파일과 유사)

전혀 프로젝트와 상관없는 파일이 git status를 쳤을때 계속 발견되는 귀찮음이 발생.  
심지어 수시로 수정될 수 있어서 충돌을 발생 시킬 수 도 있음 


  

### 해결 : gitignore 
1. ropository local 폴더 이동
2. find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch -f  명령어 입력
3. echo .DS_Store >> .gitignore  //gitignore파일 생성 및 .DS_Store파일 추가 
4. 이 후엔 그냥 커밋 후 푸시하면 이제 .DS_Store 파일은 생성이 되더라도 깃으로 관리하지는 않음

<br/>
사실 예전에도 마주했던 이슈였는데 이번 기회에 정리할 겸 작성함
