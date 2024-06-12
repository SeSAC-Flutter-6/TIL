# Polymorphism

Date: 2024년 6월 12일

다형성, 말 그대로 다양한 형태를 지닐 수 있는 성질.

인터페이스를 활용해서 여러 다른 객체를 하나의 공통된 타입처럼 추상화하여 다룰 수 있다.

## 코드 예시

```dart
abstract interface class Runnable { 
	void run()
}

class Dog implements Runnable { }
class Cat implements Runnable { }

Runnable dog = Dog()
Runnable cat = Cat()
dog.run()
cat.run()

// Swift에서는 프로토콜로 다형성 지원.
protocol Runnable {
    func run()
}

class Dog: Runnable { }
class Cat: Runnable { }

let dog: Runnable = Dog()
let cat: Runnable = Cat()
dog.run()
cat.run()
```

### 변수 선언은 추상화된 상위 타입으로, 객체 생성은 일반화된 하위 타입으로.

위 코드처럼 공통된 기능을 interface로 정의하고, 객체를 생성할 땐 일반화된 타입으로, 변수에 할당할 땐 추상화된 타입으로 할당한다.

Dog와 Cat은 서로 다른 클래스의 객체지만, 같은 인터페이스를 구현하고 있기 때문에, 공통된 타입으로 다뤄질 수 있는 것이다.

List<Runnable>처럼 컬렉션에도 같은 타입으로 담길 수 있음.
