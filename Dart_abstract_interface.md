# abstract class, interface

Date: 2024년 6월 11일

## *abstract class*

상속의 재료로 사용 되는 class이다.

field를 가질 수 있다.

일부 메서드를 선언만 해둘 수 있음.

직접 인스턴스화할 수 없다.

UML에서 Abstract한 요소들은 *Italic*으로 표기됨. 

### 구현 예시

abstract class는 extends 키워드를 사용해서 상속한다.

```dart
abstract class Unit {
	String name;
}

abstract class Monster extends Unit {
	String name;
	
	void attack(Unit unit); <- 메서드를 구현하지 않고 선언만.
}

Monster monster = Monster() // 인스턴스화 불가!
```

Swift에서는 프로토콜 지향 프로그래밍을 추구하기 때문에 추상 클래스를 공식 지원하지 않는다.

즉, 추상 클래스를 만들바에는 그냥 프로토콜로 인터페이스를 제공하는 방식으로 통일하자.

실제로 추상 클래스를 도입하려다 리젝 당한 흔적이 있음.

[https://github.com/swiftlang/swift-evolution/blob/main/proposals/0026-abstract-classes-and-methods.md](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0026-abstract-classes-and-methods.md)

### 추상 클래스를 사용하면 좋은 점

오버라이드를 하지 않는 Human Error를 방지할 수 있음

그거 말곤 사실 모르겠음. 그냥 Interface 쓰는 걸로 통일하면 안되나?

→ 헉, Interface는 필드를 가질 수 없다.. 그래서 abstract class를 써야하는 상황이 있는 듯.

Swift의 Protocol은 프로퍼티와 메소드 모두 구현 요구사항으로 선언해둘 수 있다.

킹왕짱 Swift.

## Interface

abstract class에서 field만 뺀 버전이다.

다중 상속을 할 수 있다.

기능 별로 Interface를 구현해서 상속 받는 쪽에서 어떤 기능들을 구현하고 있는지 
의미론적으로도 명시하기 용이하다고 생각함.

### 구현 예시

interface는 implements 키워드를 사용해서 상속한다.
(근데 extends를 써도 동작은 됨..)

```dart
abstract interface class Touchable {
	void tap();
}

class View implements Touchable { ... }
```
