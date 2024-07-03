### URI

- URN, URL, ... 등을 포괄적으로 부르는 말
- High-level (사람이 이해하기 쉬움)

### HTTP (Hyper Text Transfer Protocol)

- 초기 - 문서 저장용 protocol -> stateless
  - 지금은 sever - client 간 데이터 통신
- 웹 상에서 보는 이미지, 영상, 파일과 같은 바이너리 데이터도 HTTP 멀티파트나 Base64로 인코딩하여 사용

### 요청 메서드

- 요청의 형태를 정의하는 키워드
  - GET : 데이터 요청
    - body 포함 불가
    - ?와 &를 사용하는 **쿼리 파라미터** 사용 가능
    - https://jsonplaceholder.typicode.com/comments?postId=1
  - POST : 데이터가 포함된 요청
    - 웹브라우저에서 테스트 불가(Delete, put, patch도)
    - 클라 -> 서버로 데이터가 포함된 요청을 할 떄 사용 (로그인, 주문 등)
    - 쿼리 파라미터뿐만 아니라 body로 데이터 전송
  - DELETE : 삭제
  - PUT : 전부 업데이트
  - PATCH : 일부 업데이트

### 상태 코드

https://developer.mozilla.org/en-US/docs/Web/HTTP/Status

### 세션과 쿠키

- dart에서는 SharedPreference로 구현

### RESTful API

- 클라 - 서버 통신 규격
- REST: 분산 시스템을 위한 소프트웨어 아키텍처의 한 형태
  - RESTful 이란 REST 조건을 만족한다는 뜻
- 요청 주소(URL)과 메서드(GET, POST 등), JSON 규격을 이용하여 API를 정의

- post 예시
  ![alt text](file:///c%3A/Users/lgy15/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/flutter-til/TIL/Dart/network/post_example.png)
