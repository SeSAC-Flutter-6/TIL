## 추상클래스

* 상속의 재료로 사용되는 클래스
* 상세 부분이 일부 미정의 된 클래스
* 인스턴스화가 금지되어 있다.
* 추상클래스를 받는 추상클래스 가능
* 추상클래스의 메서드는 {} 이 없다.

  ```dart
  abstract class Character {
    String name;
    void speak();
  }
  ```

#### class diagram

* 추상클래스, 추상메서드는 이텔릭체로 표현.
* @override 안써도 됨. 위에 있는 메서드가 아래도 있으면 오버라이드 했다고 인지

## 인터페이스

* 모든 메서드가 추상 메서드여야 한다.
* 필드를 가지지 않는다.
* 효과 : 같은 인터페이스를 구현한 클래스들은 공통 메서드를 구현하고 있음을 보장한다.
* 상속과 달리 여러 인터페이스를 구현 할 수 있다.
* 인터페이스 안에 게터, 세터, 프로퍼티도 정의 가능하다.

  ```dart
    abstract interface class Human{
      void eat();
    }
  ```

* extends 와 implements 를 동시에 사용 가능하다.

  ```dart
  class Dancer extends Character implements Human{}
  ```








