## Type Safety
`String` `int` `double` `List` 등 타입 키워드를 사용하여 변수 또는 함수에 **Type Annotation을** 명시할 수 있다. 만일, 생략한 경우 컴파일러가 타입을 추론한다.

이를 통해 컴파일 단계에서 메모리 공간에 할당되는 데이터의 타입을 검사하여 런타임 시 타입 에러가 발생하는 것을 방지한다.

따라서 Dart는 타입 안정성을 보장한다.

## Null Safety
`?` 키워드를 통해 `Nullable` 변수를 선언한다.
예를 들어 아래와 같이 변수를 선언할 경우 name은 null이 할당될 수 있다.

```dart
// 회원가입할 때 주소를 선택적으로 받는다고 가정해보자.
// 사용자가 주소를 입력하지 않으면 기본적으로 null를 지닌다.
String? address; 
```

다만, `Nullable` 변수는 런타임에서 사용할 때 아래와 같이 Null 여부를 검증해야만 하기 때문에 **Runtime-Error** 위험성을 지니고 있음을 유의하자. 

```dart
// if문을 활용한 null check
if address != null { }

// if-null, 좌항의 변수가 Null일 경우 우항의 데이터를 반환
print(address ?? "서울 특별시 어딘가")

// null-aware assignment
address ??= "서울특별시 어딘가"

// null-aware
// Swift의 옵셔널 체이닝처럼 null이 아닌 경우에만 호출함
user?.name
```


## Variables
변수는 데이터를 여러 번 할당할 수 있다.
- **type annotation**: String, int, double, List 등 타입 키워드로 변수를 선언할 수 있다. (recommended)
- **var**: 타입 추론 변수를 선언하는 키워드

```dart
// name 변수는 컴파일러가 String 타입으로 추론하며 타입을 함께 명시할 수 없다.
var name = "홍길동";

// age 변수는 int 타입으로 명시된다.
int age = 25;

// wrong case, 타입을 같이 명시할 수 없다.
var int mobileNumber = 01000000000;
```

### Final variables(immutable)
상수는 초기화할 때 데이터를 한 번만 할당할 수 있다.
- **final**: 런타임에 초기화되는 상수
- **const**: 컴파일에 초기화되는 상수

#### Const의 위치에 따른 차이
```dart
// 예시로 List의 경우를 들어보자
// const의 위치에 따라 약간의 차이가 존재한다.
final List<int> users = [];
users = []; // Error
users.add(1); // OK
final List<int> users = const [];
users = []; // Error
users.add(1); // Error
const List<int> users = [];
users = []; // Error
users.add(1); // OK
```

기본적으로 final, const 키워드가 변수의 접두사로 사용되는 경우는 상수를 선언하는 것이다.

다만, 우측 리스트 앞에 const가 선언되는 경우에는 리스트 객체에 대한 불변성을 부여하는 것이다.
따라서 리스트가 const로 선언된 경우에는 리스트 객체의 요소를 변경할 수 없다.

이는 객체가 Heap 메모리에 생성되고, 변수와 상수에는 해당 객체의 주솟값이 할당되기 때문이다.

따라서 상수는 단순히 객체의 주솟값을 한 번 할당하고 나면 다른 주솟값을 할당할 수 없는 것이지 해당 객체의 프로퍼티는 수정할 수 있는 것이다.


### Late variables
#### late
```dart
late var name;

// critical case
// 초기화하지 않고 참조할 경우 runtime-error 발생
print(name)
```

변수에 **lazily-initializing** 특성을 부여하는 키워드. 해당 변수가 사용되는 시점에 초기화된다. 즉, 사용되기 전까지는 초기화되지 않아 메모리를 점유하지 않는다. 성능적인 비용을 절감

단, 개발자가 이를 인지하고 초기화해주어야 하기 때문에 **Runtime-error** 발생 위험이 있으니 사용을 지양하자. (Swift의 lazy와 같은 역할이라고 생각됨.)

그렇다면 언제 late를 사용할까?
어떤 프로퍼티가 같은 level에서 초기화되는 프로퍼티를 참조하는 경우 해당 프로퍼티는 late로 선언되어야 한다.

```Dart
/// age와 koreanAge는 동일한 시점에 초기화되기 때문에 koreanAge는 late 키워드를 붙여야만 age를 참조할 수 있다.
class User {
  int age = 15;
  late int koreanAge = age + 2;
}
```

### 번외, final과 late의 차이
`final`과 `late`는 기본적으로 런타임에 초기화된다는 공통점이 있다. 그러나 한 가지 차이가 존재한다.
final은 런타임에 해당 변수가 초기화 될 때 메모리를 점유한다.
late의 런타임에 해당 변수가 호출될 때 메모리를 점유한다.
즉, late의 초기화되더라도 누군가 호출해서 참조하기 전까지는 메모리에 생성되지 않는 것이다.

