# Dart Types

Date: 2024년 5월 30일

## Collections

### List

Swift의 Array와 동일하게 **순서가 보장된 컬렉션**(Ordered Collection)이고,

**index가 0부터 시작**(zero-based indexing)한다.

```dart
final List<int> numbers = [1, 2, 3, 4];

// Swift
let numbers: [Int] = [1, 2, 3, 4]
```

### Set

모든 요소는 고유하다.

List와 다르게 **순서가 보장되지 않는 컬렉션**(Unordered Collection)이다.

HashTable을 기반으로 하여 값 자체를 해쉬화 하여 key로 사용하기 때문에 검색 속도가 빠르다.

```dart
final Set<int> ids = { 001, 002, 003 };
var names = <String>{};

// Swift
let ids: Set<Int> = [001, 002, 003]
```

### Maps

key: value 형태로 데이터가 저장된다.

key는 고유해야 한다.

```dart
var gifts = {
	'first': 'partridge',
	'second': 'turtledoves',
	'fifth': 'golden rings'
};
var gifts = Map<String, String>();

// Swift에서는 Dictionary 라는 이름의 동일한 자료구조가 있다.
let users: [String: String] = [
	'first': 'partridge',
	'second': 'turtledoves',
	'fifth': 'golden rings'
]
```

## Functions

### first-class objects

Dart의 Functions은 first-class objects이다. (Swift의 함수 역시 1급 객체)

즉, 변수에 함수를 할당할 수 있고, 함수의 인자로 함수를 넘길 수 있다는 것이다.

```dart
var loudify = (msg) => '!!!! ${msg.toUpperCase()} !!!';
assert(loudify('hello') == '!!! HELLO !!!');

// Swift
let say: (String) => () = { message in
	print(message)
}
say("HelloWorld")
```

### type annotations

```dart
bool isNoble(int atomicNumber) {
	return _nobleGases[atomicNumber] != null;
}

// 함수의 return type을 생략할 수 있다. 그러나 dynamic type으로 추론되기 때문에 지양할 것.
isNoble(atomicNumber) {
	return _nobleGases[atomicNumber] != null;
}

// Swift는 생략 불가능.
func isNoble(atomicNumber: Int) => Bool {

}
```

### parameters

**named parameter**와 **optional positional parameters**를 지원한다.

그러나 이 둘을 하나의 함수에서 동시에 사용할 수는 없다.

### named parameter

말 그대로 파라미터에 이름을 표기할 수 있다. named parameter를 선언한 함수를 사용할 때는 인자 앞에 파라미터 name field를 함께 명시해야한다.

named parameter를 사용하면 외부에서 함수를 사용할 때 인자의 역할과 함수 설계 의도를 전달하는데 효과적이라고 생각한다. 다만, dart의 named parameter는 Swift와 다르게 문법이 괴랄한 것 같다.

딱 3가지 버전만 기억하면 됨.

**required**를 앞에 붙이거나,

**nullable type**으로 선언하거나,

**default value**를 할당하거나

코드로 살펴보자.

```dart
void enableFlags({bool? bold, required bool hidden, bool isEnabled = true}) {...}

enableFlags(bold: true, hidden: false //isEnabled는 default value가 있기 때문에 생략 가능);
```

### Optional positional parameters

named parameter를 사용하지 않고, 파라미터를 선택적으로 받고 싶을 때 사용한다.

```dart
// Nullable 또는 default value를 지정해야 한다.
String say(String from, String msg, [String? device]) {
	return '$from says $msg';
}
```

### Swift에서는 보다 간단하고 가독성 있다.

```swift
func say(argumentLabel parameterLabel: String) { ... }

// 또한 wild card 문법으로 argumentLabel을 생략할 수 있다.
func say(_ parameterLabel: String) { ... }
// Swift에서는 Optional type으로 선언하여도 required parameter이다.
func say(_ parameterLabel: String?) { ... }
// Swift에서는 default value를 지정해야 optional parameter로 사용된다.
func say(_ parameterLabel: String? = nil) { ... }
```

아,, Swift 코드 예쁘네

### Anonymous functions

익명 함수. Swift의 Closure와 같은 역할을 한다.

```swift
// Dart
(Type param) {
	codeBlock;
}

// 만약 타입 추론을 사용한다면
(param) {
	codeBlock;
}

// Swift
{ (param: Type) in
	codeBlock;
}

// 만약 타입 추론을 사용한다면
{ param in
	codeBlock;
}
```

### Lexical scope

변수의 생명 주기는 함수의 Scope(대괄호)안에서만 유효하다.

또한, 상위 Scope에서 하위 Scope로 흘러간다.

### Lexical closures

익명 함수를 1급 객체로 지원하는 프로그래밍 언어라면 대부분 Closure Capture 메커니즘이 존재한다.

```dart
// int addBy를 파라미터로 받아서, int i를 받아 addBy와 연산하는 클로져를 반환
Function makeAdder(int addBy) {
	return (int i) => addBy + i;
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
```

자 위와 같은 경우에 add2(3)의 결과는 5 이고 add4(3)의 결과는 7이다. 왜 그런 것일까?
add2와 add4에는 makeAdder라는 함수가 클로져 형태로 저장된다. 이때 파라미터로 넘겨 받은 addBy가 main 함수 바깥에 있음에도 불구하고 capture되어 연산이 가능해지는 것이다.

캡쳐된 변수는 상식적으로 Stack의 함수 frame이 아닌 Heap 메모리에 저장되지 않을까 추론해본다. (추후 직접 확인해보자)
