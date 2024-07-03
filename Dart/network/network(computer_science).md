# 컴퓨터 네트워크 - Application

## Socket

---

- Socket = 네트워크에 연결된 장치간 프로세스끼리 데이터를 송수신 할 수 있게 하는 통로
- 특정 프로세서로 메세지를 보내기 위해서는 목적지 호스트의 주소를 알고 있어야함
  - 호스트의 주소 ⇒ IP
  - 호스트 내의 프로세스 ⇒ 포트 번호

## HTTP

---

1. Persistent

   1. 지속성
   2. non-persistent HTTP : 매 http 마다 TCP 커넥션 맺음, 사용 후 close
   3. persistent HTTP : 클라이언트/서버 간 하나의 TCP 커넥션으로 여러개의 http 송수신 수행
   4. 응답 시간 : persistent > non-persistent

2. Web Cache + proxy server

3. proxy

   - 서버와 클라이언트 사이에 중계기로서 대리로 통신 수행하는 것 ‘proxy’

4. cache
   - 데이터나 값을 미리 복사해 놓는 임시 장소
   - 프록시 서버에 캐시 저장해두면?
     - 동일 요청 빠르게 처리 가능
     - 로컬에서 동일 리퀘스트 처리 → 서버 부담 감소
     - 트래픽 감소 → 이용료 감소
     - 보안 이슈 발생 가능
     - 캐시와 서버의 데이터 반영이 안되는 문제 발생가능 (일관성 문제)
5. Conditional Get

   1. 캐시 일관성 문제 발생가능
   2. 브라우저에 전달되는 객체들이 최신임을 확인하며 캐싱할 수 있도록 Conditional Get 사용
      - HTTP 요청 헤더 : If-Modified-Since
      - 서버 객체의 마지막 수정 날짜와 비교
      - 수정 객체라면 200 + data
      - 최신상태면 304 Not modified

6. 쿠키

- HTTP의 stateless을 해결하기 위해 등장
- HTTP 헤더에 포함되는 텍스트 데이터 파일
- 이름, 값, 만료기간, 경로 정보, 키, 벨류로 구성
- 보안성이 낮음

## DNS

---

1. DNS

   1. Domain Name System 약자
   2. hostname을 ip주소로 해석 (eg. 전화번호부)
   3. hierarchial database

1. centralize 하지 않는 이유

   1. 트래픽 집중 시 전부 무너질 수 있음 (single point of failure)
   2. 먼 거리에 위치한 국가의 데이터베이스는 접근성이 떨어짐
   3. scaleability 불가

1. DNS 서버 작동방식

   → 클라이언트에서 조회 메세지를 받고 조회 내용에 응답하는 형태로 정보 회답

   1. 조회에 필요한 정보

      1. 이름 (서버나 메일 배송 목적지와 같은 이름)
      2. 클래스 (IN, 초창기 DNS 설계 시엔 인터넷 이외의 네트워크도 고려하였지만 전부 소멸되었기에 인터넷을 나타내는 IN 값으로 표기)
      3. 타입 ( 이름에 어떤 타입(종류)의 정보가 지원되는지 표기)
         - A (address) : 이름에 ip 주소 지원
         - MX (Mail eXchange) : 이름에 메일 배송 목적지 지원

      | 이름                                     | 클래스 | 타입 | 리턴                |
      | ---------------------------------------- | ------ | ---- | ------------------- |
      | www.test.co.kr                           | IN     | A    | 190.0.2.226         |
      | cyber.co.kr                              | IN     | MX   | 10 mail.cyber.co.kr |
      | (배송 목적지 우선순위, 메일 서버의 이름) |
      | mail.cyber.co.kr                         | IN     | A    | 192.0.2.227         |

   2. 도메인의 계층
      1. TLD(Top-Level Domain)
         - .com, .org, .net
         - authoritative server
           - 네트워크를 운영하는 기관에서 보유하고 있는 도메인의 경우 기관에서 매핑에 대한 수행을 하기 위해 운영하는 DNS 서버 (대학 도메인 내부 사이트들)
      2. Local DNS name server
         - 내부 요청 DNS 쿼리들에 대한 결과를 캐싱(호스트-아이피 매칭 결과 저장)

[How the DNS works](https://youtu.be/2ZUxoi7YNgs)

## 소켓 통신

소켓이란?

- 소켓은 네트워크를 경유하는 프로세스 간 통신의 종착점
- 소켓은 포트 번호에 binding되어 transport layer에서 데이터가 전달되야하는 애플리케이션을 식별케 함
- 즉, OSI 7 계층의 application layer에 존재하는 네트워크 응용 프로그램들은 데이터를 송수신 하기 위해 소켓을 거쳐 transport layer의 통신 망으로 전달함으로써 데이터 교환

## 일반적인 소켓 통신의 흐름

- UDP는 connect, accept 없이 소켓 생성 후 바로 데이터 송수신

- TCP 프로그래밍
  1. TCP 연결 설정 (handshake and establish)
  2. 서버는 프로세스를 먼저 수행하고 있어야 하며 특별한 소켓을 가지고 있어야 한다. (특정 포트 바인딩 포함) 클라이언트는 서버의 IP 주소(welcome 소켓의 주소)와 소켓의 포트 번호를 명시한다.
  3. 서버가 노크 소리를 들으면 클라이언트에게 지정되는 새로운 소켓 생성. (이것-connectionSocket이랑 welcome 소켓은 다름)
  4. 소켓끼리 pipe에 의해 직접 연결되며 임의의 바이트를 주고 받을 수 있다.

## 소켓 종류

### **스트림(TCP - transmission control protocol 사용)**

- 연결 지향성 소켓
- 송수신자의 연결을 보장
- 데이터 순서 보장
- 많은 데이터 전송에 적합
- 1대1
- TCP의 높은 신뢰성, 3-way handshaking, 4-way handsahking, 데이터 흐름 제어, 혼잡 제어

### **데이터그램 (UDP - user diagram protocol)**

- 비연결형 소켓
- 데이터 크기 제한
- 신뢰성 x, 데이터 손실되도 문제 없음
- 실시간 멀티미디어 정보 처리
- 1대n

## **HTTP 통신과 소켓 통신의 차이**

### (1) HTTP 통신

- 클라이언트의 요청이 있을 때만 서버가 응답
- JSON, HTML, Image 등 다양한 데이터를 주고 받을 수 있음
- 서버가 응답한 후 연결을 바로 종료하는 단방향 통신이지만 Keep Alive 옵션을 주어 일정 시간동안 커넥션을 유지할 수 있다.
- 실시간 연결이 아닌 데이터 전달이 필요한 경우에만 요청을 보내는 상황에 유리

### (2) 소켓 통신

- 클라이언트와 서버가 특정 포트를 통해 양방향 통신을 하는 방식
- 데이터 전달 후 연결이 끊어지는 것이 아니라 계속해서 연결을 유지 → HTTP에 비해 더 많은 리소스 소모
- 클라이언트와 서버가 실시간으로 계속하여 데이터를 주고받아야하는 경우에 유리
- 실시간 동영상 스트리밍이나 온라인 게임 등에 사용

---

p.s) 더 공부하고 싶으면 다중화와 역다중화에 대해 찾아보세요.
https://the-brain-of-sic2.tistory.com/52
