### CSV

- 데이터를 콤마로 나타낸 형식
  ` String str = "홍길동,한석봉,심사임당";`

### Properties

- Properties 클래스를 사용하여 키(key)와 값(value)의 쌍으로 읽고 쓰기가 가능

* data.properties의 내용:
  - heroName = 홍길동
  - heroHp = 100

### XML

- <> 태그를 활용한 방식

```
<note>
  <to>Move</to>
</note>w
```

- 공공 데이터를 활용하려면 JOSN뿐만 아니라 XML도 활용할 줄 알아야 한다.
- DOM Parser, SAX Parser 등을 통해 파서를 제작할 필요가 있음

### JSON

- 키(key): 값(value) 형태
- [] 로 리스트, {} 로 객체를 표현

```
{
  "이름" : "홍길동",
  "나이" : 25
}
```

### 직렬화

- 데이터 구조나 객체 상태를 저장하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정
- 객체를 파일의 형태 등으로 저장하거나, 통신하기 쉬운 포맷으로 변환하는 과정을 의미
- 클래스 내부의 필드에 다른 클래스가 있다면 모두 직렬화 처리를 해 줘야 함

* 직렬화 : Class -> Json
* 역직렬화 : Json -> Class
  ![alt text](json.PNG)

* 실제 서버에선 Json형태의 String으로 데이터가 들어옴

  - json 형태로 바꿔줄 필요가 있음. (jsonDecode)

  * 서버로 보내줄 땐 String 형태로 바꿔서 보내줘야 함 (jsonEncode)
