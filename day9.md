# Day8_다형성

## 다형성  (**Polymorphism)**

- 어떤 것을 이렇게도 부를 수 있고, 저렇게도 부를 수 있는 것
- ex) 핸들이 있고, 오른 페달이 액셀, 왼쪽이 브레이크인 것 = 
차, 그랜저, 버스 …세부적인 부분 부분은 다르지만, 어쨌든 대충 보면 그냥 차다

### 다형성을 활용하는 방법:  공통 메소드를 통합1

```dart

// 부모 클래스 (인터페이스 역할)
abstract class Animal {
  void makeSound();
}

// 자식 클래스
class Dog implements Animal {
  @override
  void makeSound() {
    print('Bark!');
  }
}

class Cat implements Animal {
  @override
  void makeSound() {
    print('Meow!');
  }
}

void main() {
  // Animal 타입의 리스트에 다양한 Animal 객체를 담을 수 있다.
  List<Animal> animals = [Dog(), Cat()];

  // 각 객체는 자신의 구현에 따라 다르게 동작한다.
  for (var animal in animals) {
    animal.makeSound(); // 출력: Bark! Meow!
  }
}
```

### 다형성의 장점

- 코드 재사용성: 공통 인터페이스를 사용하여 다양한 객체를 다룰 수 있으므로 코드의 재사용성이 높아진다.
- 유연성: 새로운 클래스가 추가되더라도 기존 코드를 변경할 필요 없이 쉽게 확장할 수 있다.
- 유지보수성: 코드가 더 구조화되고 명확해져 유지보수가 용이하다.

### 타입 변경 방법 (cast)

```dart
void main() {

	//타입변경 실패 가능성이 있음
	Character character = Wizard('name', 10);
	Hero hero = character as Hero;  
	
	//이방법 권장, 자동 타입변경 (smart cast)
	Character character = Wizard('name', 10);
	if (character is Hero) {
		Hero hero = character;
	}
}
```

### 다형성의 메리트를 활용 못 한 코드

```dart
void main() {
	final h1 = Hero('수퍼맨', 100);
	final h2 = Hero('배트맨', 200);
	final h3 = Wizard('해리포터', 50);
	final h4 = Wizard('헤르미온느', 50);
	
	h1.hp = h1.hp + 50;
	h2.hp = h2.hp + 50;
	h3.hp = h3.hp + 50;
	h4.hp = h4.hp + 50;
}
```

### 코드의 중복 제거(다형성의 메리트: 동일한 타입으로 취급)

```dart
void main() {
	final characters = <Character>[];
	characters.add(Hero('슈퍼맨', 100));
	characters.add(Hero('배트맨', 200));
	characters.add(Wizard('해리포터', 50));
	characters.add(Wizard('헤르미온느', 50));
	
	characters.forEach((character) {
		character.hp += 50;
	});
}
```