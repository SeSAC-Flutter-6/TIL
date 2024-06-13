# Day9_인스턴스 기본 조작

### Object 클래스의 기본 기능

- 모든 클래스는 Object 클래스의 메서드와 프로퍼티를 가지고 있다
- Object 타입 변수에는 모든 인스턴스를 대입할 수 있다
- Object 클래스의 대표 메서드 및 프로퍼티
- toString(): 문자열 표현을 얻음
- operator ==: 비교
- hasCode: 해시값을 얻음 
- runtimeType: 런타임 타입을 얻음

```dart
void main() {
	Hero hero = Hero();
	Object object = hero; 
}

```

```dart
class Hero {

// Hero class가 암묵적으로 Object 클래스를 상속받아서 toString 메서드를 가진다.
	@override  
	String toString() {
		return 'Hero{}'; 
	}
}
```

### 연산자 재정의

- ==: 참조의 비교
- == 연산자를 재정의 하여 나만의 동등성 규칙을 정의할 수 있다.
- 동등성을 비교할 때는 클래스 내부의 모든 속성의 동등함을 비교해야 한다

```dart
class Book {
  String title;
  String comment;
  DateTime publishDate;

// title과 publishDate 두가지 속성으로 동등성 비교하는 경우 
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  @override
  int get hashCode =>
      title.hashCode ^
      publishDate.year.hashCode ^
      publishDate.month.hashCode ^
      publishDate.day.hashCode;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  String toString() {
    return 'Book{title: $title, comment: $comment, publishDate: $publishDate}';
	  }
  }
}
```

### Set, Map의 동작 원리

Set, Map 계열은 요소를 검색할 때 hashCode를 사용하여 빠르다. List는 순차검색이라 느림

1. 모든 객체는 해시값을 가진다
2. 동일한 객체는 항상 같은 해시값을 가진다

```dart
//Set, Map을 사용하면 hashCode 재정의를 할 필요가 있다.
@override
int get hashCode => isbn.hashCode;
//일반 적으로 == (equals) 와 hashCode를 동일 규칙으로 함께 정의한다.
```

### 리스트에서 요소 정렬

- List.sort() 메서드는 컬렉션 내부를 정렬해 줌 하지만 sort() 메서드를 사용하기 위해서는 
정렬 대상이 Comparable 인터페이스를 구현하거나 sort 함수가 직접 정렬 대상의 정렬 규칙을 
Comparator 함수로 구현해야 한다.

```dart
void main() {
	
	//기본 정렬 
	//a < b 이면 음수 -1
	//a > B 이면 양수 +
	//a == 0 이면 0
  List<int> numbers = [10, 2, 30, 4, 5];
  numbers.sort((a, b) => a.compareTo(b));
  print(numbers); // [2, 4, 5, 10, 30]
  
 
   List<Person> people = [
    Person('Alice', 30),
    Person('Bob', 25),
    Person('Charlie', 35),
  ];

	//Comparator 사용하여 나이순으로 정렬하게 정의
  people.sort((a, b) => a.age.compareTo(b.age));
  print(people); // [Bob (25), Alice (30), Charlie (35)]
  
  //나이가 같다면 이름순으로 정렬 
    List<Person> people = [
    Person('Alice', 30),
    Person('Bob', 25),
    Person('Charlie', 35),
    Person('Dave', 30),
  ];

  people.sort((a, b) {
    int ageComparison = a.age.compareTo(b.age);
    if (ageComparison != 0) {
      return ageComparison;
    } else {
      return a.name.compareTo(b.name);
    }
  });

  print(people); // [Bob (25), Alice (30), Dave (30), Charlie (35)]
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() => '$name ($age)';
}
```

### Deep copy

- Dart에서는 깊은 복사를 위한 별도의 기능을 지원하지 않아서 직접 작성해서 사용해야함.
- Deep copy는 원본 객체와 복사된 객체가 서로 독립적으로 존재한다.

```dart
  //깊은복사 직접작성 
  Book copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
  }) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }

  Book books1 = Book(title: '자바의정석', comment: '11');
  //깊은복사: 원본객체와 복사된 객체 서로 독립적   
  Book deepCopy = books1.copyWith(title: books1.title,comment: books1.comment);
  deepCopy.title = '플러터의 정석';
  print(books1.title); // 자바의 정석
  
  //얕은복사: 원본객체와 복사된 객체가 동일한 참조를 공유
  Book shallowCopy = books1;
  shallowCopy.title = '플러터의 정석';
  print(shallowCopy.title); // 플러터의 정석
```