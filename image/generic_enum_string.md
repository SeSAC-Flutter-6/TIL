## 제네릭

1. 타입이 없을 때의 문제점

* 런타임 에러가 나기 쉽다.
* IDE가 컴파일 에러를 미리 찾을 수 없다.

2. 제네릭 사용 효과

* 타입을 나중에 원하는 형태로 정의할 수 있다.
* 타입 안전 효과가 있다.
* 제네릭을 사용하면 코드를 타입에 독립적으로 만들 수 있어서 유지보수가 쉽고, 코드의 재사용성이 높아진다.
* 제네릭 클래스를 정의하면, 특정 타입에 관계없이 클래스의 인스턴스를 생성할 수 있다.

3. 제네릭 사용 예시

    ```dart
    class Pocket<E> {
      E? data;

      void put(E data) {
        _data = data;
      }

      E? get() {
        return _data;
      }
    }
    ```

   `Pocket`클래스는 제네릭으로 정의되어 있고, `E`는 타입 매개변수이다. 이렇게 하면 Pocket 클래스를 사용할 때 원하는 타입의 값을 저장할 수 있다.

    ```dart
    void main() {
      Pocket<String> pocket1 = Pocket();
      Pocket<int> pocket2 = Pocket();
      pocket1.put('present');
      pocket2.put(2);
    }
    ```

   제약을 추가한 Pocket 클래스

    ```dart
    class Pocket<E extends Book> {
      E? data;

      void put(E data) {
        _data = data;
      }

      E? get() {
        return _data;
      }
    }
    ```

## 열거형(enum)

* 정해 둔 값만 넣어둘 수 있는 타입
* 다른값은 허용되지 않고 미리 정의된 값만을 가질 수 있기 때문에 오류 확률이 감소한다. => 휴먼에러를 방지할 수 있다.
* switch와 사용할때 enum에 정의된 모든 값을 케이스로 모두 작성해야 한다.

  ```dart
  enum Status {
    pending,
    approved,
    rejected,
  }

  void Message (Status status) {
    switch (status) {
      case Status.pending:
        print('대기입니다.');
        break;
      case Status.approved:
        print('승인입니다.');
        break;
      case Status.rejected:
        print('거절입니다.');
        break;
    }
  }
  ```

## 문자열 조작

1. 결합

   +로 결합 가능

2. 일부 떼어내기

    ```dart
    string.substring(0,2); //0번째 부터 시작해서 앞에서 2번째 것까지 떼어내기
    ```

3. 일부 치환

    ```dart
    string.replaceAll('ll','XX'); //ll을 XX로 치환하기
    ```

4. 분리

    ```dart
    string.split(','); //','을 기준으로 분리하기
    ```

5. 대소문자 변경

    ```dart
    string.toUpperCase(); //대문자로 변경
    string.toLowerCase(); //소문자로 변경
    ```

6. 검색 1

    ```dart
    string.indexOf('E') // E의 index 검색
    ```  

7. 검색 2
    * contains('A')
    * endsWith('A')
    * indexOf('A')
    * lastIndexOf('A')

8. 변환
    * trim() // 좌우 공백 제거

## 문자열

* String은 불변이다.
* 값이 같으면 주소가 같다.
* 내부적으로 한번 만들어 놓은 객체는 Stringpool에서 별도로 관리를 한다.

## 문자열 결합

1.
    + 연산자 사용
      String은 불변객체이기 때문에 인스턴스가 매번 생성되서 느리다.

2. StringBuffer
   write() 메서드로 결합한 결과를 내부 메모리(버퍼)에 담아 두고 toString()으로 결과를 얻는다.

    ```dart
    final buffer = StringBuffer('Dart');

    buffer
      ..write(' and ')
      ..write('Flutter');

    print(buffer.toString());
    ```

## Accessor, Mutator

* Mutator
  실제로 값을 변경 시키는것

* Accessor
  가공해서 돌려준다. 원래의 값은 변하지 않는다.


* 일반적으로 그렇지만, String은 불변인 것을 잊지 말자!

* 객체 내부를 바꾸는 것과 새로운 객체를 할당 하는 것은 다르다.

   ```dart
   void main() {
     int luckyNumber1 = 13;
     int luckyNumber2 = luckyNumber1;
     luckyNumber2 = 12;

     print(luckyNumber1); // 13
     print(luckyNumber2); // 12

     String luckyString3 = '13';
     String luckyString4 = luckyString3;
     luckyString4 = '12';

     print(luckyString3); // 13
     print(luckyString4); // 12

     Hero hero1 = Hero(name: 'name', hp: 100);
     Hero hero2 = hero1;
     hero2 = Hero(name: '이름', hp: 1);

     print(hero1); // Hero{hp: 100, name: name}
     print(hero2); //Hero{hp: 1, name: 이름}
   }
   ``` 
     