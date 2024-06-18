## 예외(Exception)

* 프로그램 실행 시 발생할 수 있는 에러를 예측하여 프로그램이 죽지 않도록 사전에 에외 처리가 되도록 해야 한다.
* 런타임 에러를 대처한다.
* 예외 처리의 흐름

  ```dart
  try{
    // 에러가 날 것 같은 코드 작성
  } catch (e) {
    // e : 에러의 정보를 담고 있는 객체
  }
  ```

* rethrow </br> 에러 처리를 미룬다.

* finally </br>
  무조건 실행되는 코드. 나중에 항상 해야하는 처리를 할 수 있다.

  ```dart
  void main() {
    final numString = '10.5';
    int num;
    try {
      num = int.parse(numString);
    } catch (e) {
      print(e);
      num = 0;
    } finally {
      print(num); // error
    }
  }
  ```
  💡 int num을 사전에 초기화 하지 않고 try catch 문에서 초기화 할 경우 finally 블럭에서 사용 전 초기화하라는 에러가 발생한다. late를 사용하거나 사전에
  int num에 0을 할당해 줄 수 있다.

  ```dart
  void main() {
    final numString = '10.5';
    int num = 0;
    try {
      num = int.parse(numString);
    } catch (e) {
      print(e);
    } finally {
      print(num);
    }
  }
  ```

## 파일 조작

* 파일 조작의 기본 순서

1. 파일을 연다.
2. 파일을 읽거나 쓴다.
3. 파일을 닫는다.

* 파일 열기

  ```dart
  final myFile = File('save.txt');
  ```

* 내용 쓰기

  ```dart
  myFile.writeAsStringSync('Hello, world!');
  ```

* 파일 읽기

  ```dart
  final text = myFile.readAsStringSync();
  ```

* 파일 복사하기 </br>
  파일1을 복사한 파일2를 만드는 경우</br>
  파일1 열기 -> 파일1 읽기 -> 파일 2 열기(생성) -> 파일 2에 파일1 읽은 내용 쓰기

## 여러가지 데이터 형식

* csv </br>
  데이터를 콤마로 나눈 형식

* 프로퍼티 </br>
  Properties 클래스를 사용하여 키와 값의 쌍으로 읽고 쓰기가 가능

* XML </br>
  <> 태그를 활용한 기술 방식</br>
  포함관계를 기술할 수 있다.</br>
  파서를 제작해서 사용해야 한다.</br>

* JSON </br>
  네트워크 통신에서 가장 많이 사용되고 있다. </br>
  XML용량이 적다
  </br>
  키 : 값의 형태이다. dart의 Map과 똑같이 생겼다.
  </br>
  사람이 보기에도, 컴퓨터가 보기에도 Json이 좋다.

### 직렬화

* 데이터 구조나 객체 상태를 저장하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정
* 객체를 파일의 형태 등으로 저장하거나, 통신하기 쉬운 포맷으로 변환하는 과정을 의미한다.
* 클래스 내부의 필드에 다른 클래스가 있다면 모두 직렬화 처리를 해줘야 한다.

#### 다트에서의 직렬화

* 직렬화 : 클래스 -> json
  </br>
  toJson() : 객체를 Json형태로 표현하는 메서드

  ```dart
  Map<String, dynamic> toJson() => {'name' : name, 'email' : email,};
  ```

* 역직렬화 : json -> 클래스
  </br>
  fromJson() : Json(실제로는 Map) 으로부터 객체를 생성하는 생성자

  ```dart
  User.fromJson(Map<String, dynamic> json) : name = json['name'], email = json['email'];
  ```

#### JsonEncode, Decode

* 실제로 서버에서는 Json형태의 String으로 들어와 Encoding과 Decoding을 해줘야 한다.

* jsonDecode</br>
  Json형태의 String-> Map

* jsonEncode </br>
  Map -> Json형태의 String

* toString()과 jsonEncode의 차이
  </br>
  toJson()으로 만든 Json을 Json형태의 String으로 바꿔줄때 jsonEncode가 아닌 toString()을 사용해 String으로 변환해줘도 될 것 같다고
  생각했었는데 print를 찍어보면 형태가 다르다는 것을 알 수 있다.

    ```dart
      Employee employee = Employee(name: '홍길동', age: 41);
      print(employee.toJson().toString());
      print(jsonEncode(employee.toJson()));
    ```
    * jsonEncode </br>
      `{"name":"홍길동","age":41}`

    * toString </br>
      `{name: 홍길동, age: 41}`

* toString()을 사용할 경우 ""이 없어 Json의 형태가 아니다. 반드시 jsonEncode()를 사용해야 한다.