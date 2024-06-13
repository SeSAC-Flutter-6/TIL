## 인스턴스 기본 조작

### 오브젝트 클래스

* The base class for all Dart objects except null. [공식문서]

  ```dart
  class Hero extends Object{
  }
  ```

* 모든 클래스는 Object 클래스의 메서드와 프로퍼티를 가진다.
* Object 타입 변수에는 모든 인스턴스 대입 가능하다.
* 대표 메서드 및 프로퍼티
    * `toString()`
    * `operator == `
    * `hashCode`

#### toString()

* 오버라이드하여 원하는 결과가 출력되도록 할 수 있다.

  ```dart
  void main() {
    Hero hero = Hero(name: '홍길동', hp: 100);
    print(hero);
  }
  ```

1. 오버라이드 안한 경우    
   결과 : Instance of 'Hero'

2. 오버라이드 한 경우
    ```dart
    @override
    String toString() {
      return 'Hero{name: $name, hp: $hp}';
    }
    ```
   결과 : Hero{name: 홍길동, hp: 100}

#### operator == , hashCode

* `==`는 연산자는 동등성을 비교하는데 사용된다.
* operator 재정의를 통해 동등성 규칙을 정할 수 있다.
* 일반적으로 동등한 객체는 동일한 hashCode 값을 가지기 때문에 동등성 비교를 하기 위해서는 ==연산자와 hashCode를 다 맞춰야 한다.
* Man 이라는 클래스의 컨스트럭터로 생성된 인스턴스들은 동등하지 않지만 오버라이드를 통한 ==연산자 재정의로 나만의 동등성 규칙을 정의할 수 있다.

  ```dart
  class Man {
    String name;
    int age;

    Man({
      required this.name,
      required this.age,
    });

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is Man &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            age == other.age;

    @override
    int get hashCode => name.hashCode ^ age.hashCode;
  }

  void main() {
    Man man1 = Man(name: '홍길동', age: 20);
    Man man2 = Man(name: '홍길동', age: 20);

    print(man1.hashCode == man2.hashCode);  //true 출력
  }
  ```

  이름과 나이가 같을 경우 동등한 것으로 취급한다고 임의로 재정의하면 man1과 man2가 동등하다고 출력되고, set, map에서도 동일한 객체로 판단하게 된다.

#### sort()

* sort() 메서드는 컬렉션 내부를 정렬해 준다.
* sort()를 사용하기 위해서는 정렬 대상이 Comparable 인터페이스를 구현하거나 sort 함수가 직접 정렬 대상의 규칙을 Comparator 함수로 구현해야 한다.

* Comparable 인터페이스를 구현한 Hero 클래스의 compareTo 재정의

  ```dart
  class Hero implements Comparable<Hero> {
    String name;
    int hp;

    Hero({required this.name, required this.hp});

    @override
    int compareTo(Hero other) {
      return hp.compareTo(other.hp);
    }
  }
  ```
* sort()에서 비교함수 직접 구현

  ```dart
  void main() {
    Hero hero = Hero(name: '홍길동', hp: 100);
    Hero hero1 = Hero(name: '홍길동', hp: 2);
    List<Hero> heroes = [hero, hero1];
    heroes.sort((a, b) => -a.hp.compareTo(b.hp));
    print(heroes);
  }
  ```

### 단축키

* control + h : 클래스의 상속관계를 알 수 있다.
* cmd + f12 : 모든 메서드를 볼 수 있다.