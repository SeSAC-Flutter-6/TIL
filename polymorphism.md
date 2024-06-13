## 다형성(polymorphism)

* 어떤 것을 이렇게도 부를 수 있고, 저렇게도 부를 수 있는 것
* 상위 개념으로 다 묶을 수 있는 것
* as를 사용해 타입캐스팅을 할 수 있다. 그러나 위험함으로 is를 사용하여 확인하고, 타입캐스팅을 하는 것이 좋다.

### 예시 1

`attack()`메서드가 있는 클래스 `Character`과, Character을 `implement`하고 `fireball)()`이 있는 클래스 `Wizard`가 있다.

```dart
void main() {
  Wizard wizard = Wizard('마법사', 50);
  Character character = wizard;
  Slime slime = Slime('A');

  character.attack(Slime);
  character.fireball(slime); // error
}
```

컴파일러가 최종적으로 `character`을 보고 있는데, `character` 안에 `fireball()` 은 없다. 그래서 실행이 안됨. 공통기능만 실행가능하다.

### 예시 2

`run()` 메서드가 있는 클래스 `Monster`와 Monster을 상속받아 `run()`을 오버라이드한 클래스 `Slime`이 있다.

Monster의 run()은 run1을 프린트하고, Slime의 run()은 run2를 프린트한다.

```dart
void main() {
  Slime slime = Slime('A');
  Monster monster = Slime('B');

  slime.run(); // run2
  monster.run(); // run2
}
```

* 어떤 기능이 있는지는 선언한 타입으로 기능이 제공이 되고, 실체에서 오버라이드 된 것이 최종적으로 사용된다.

##인터페이스

* 메서드만 있는 경우를 인터페이스로 주로 쓴다. 프로퍼리로 사용하면 복잡해진다.

* 그루핑을 위해 빈 인터페이스를 사용하는 경우가 있다.


