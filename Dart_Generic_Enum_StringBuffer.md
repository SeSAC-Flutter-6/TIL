published: 2024-06-14

## 배운 것

### 1. 제네릭 문법
Class 내부에서 사용할 타입을 추상화할 수 있다. 
즉, 타입을 나중에 정하기로 하고 사용한다는 것.
사실 `List<E>` , `Map<K, V>` 와 같은 컬렉션을 선언할 때부터 우리는 이미 제네릭을 사용하고 있었음.
List가 배열의 요소 타입을 제네릭으로 받도록 구현되어 있음.
```dart
abstract interface class List<E> implements Iterable<E>, _ListIterable<E> {
... 
}

```

근데 한 가지 유의해야할 점이 있음.
타입을 제네릭으로 받기로 했다고 해서 자유롭게 쓸 수 있는 것이 아님.
이 타입이 어떤 메소드, 프로퍼티를 갖고 있는지 알 수도 없고 정해지지도 않았기 때문.

그래서 제네릭 문법은 대부분의 경우
특정 인터페이스를 구현하고 있는 타입, 특정 클래스를 상속 받고 있는 타입만 받도록 제약 조건을 같이 주어야함. 

Swift도 제네릭 문법은 비슷함.
### 2. 열거형
열거형은 말 그대로 열거할 수 있는 데이터를 위한 타입이라고 생각한다.
동적으로 결정되는 데이터가 아닌, 정적으로 열거되는 데이터의 경우에는 열거형이 적합하다. 

예를 들면 에러를 정의한다거나
```dart
enum NetworkError {
	serverError,
	invalidRequest
}
```

데이터의 유형을 정의해둘 수 있음.

```dart
enum animalType {
	초식동물,
	육식동물
}
```

### Mutator, Accessor
Mutator: 원본을 수정하는 메서드
Accessor: 수정된 사본을 반환하는 메서드

관례적으로 Mutator 메서드의 이름은 동사
Accessor는 동사 과거형으로 작성함

sort() -> Mutator
sorted() -> Accessor


### String과 StringBuffer
Dart 언어에서 String은  Reference Type이면서 immutable(불변적인)한 타입임. 따라서 replaceAll 같은 mutator 메소드를 실행해도 원본 객체는 바뀌지 않음.
(근데 그럼 왜 API를 제공함?)

문자열끼리 결합하는 연산을 진행하는 경우 새로운 문자열 객체를 생성하는 방식으로 동작함. -> 성능적인 비용이 높은 편.

따라서 문자열 연산이 요구되는 작업의 경우 StringBuffer가 더 적합한 타입임.
StringBuffer는 문자열 결합 시 결합된 내용을 write() 메소드를 통해 버퍼 메모리에 저장하고 toString() 메소드를 통해서 연산 결과를 받을 수 있음 
-> 훨씬 적은 비용과 빠른 속도로 문자열 연산을 수행함.

또한, 문자열이 Reference Type인 언어들은 내부적으로 문자 객체를 String pool에 저장하여 동일한 문자를 생성하려고 하는 경우 별도의 객체를 생성하는 것이 아닌 Stirng pool에 있는 객체를 재사용함.

```dart
String a = '가나다';
String b = '가나다';
```

따라서 위 코드의 경우 a와 b는 각각 문자열 객체를 생성하는 것처럼 보이지만,
내부적으로는 String pool에 가나다 라는 객체가 1개만 생성되어 재사용됨.
-> 메모리 주소도 동일. hashCode도 동일.

### Swift에서 String은?
스위프트에서는 String이 Value Type이다. 

그렇다면 우리는 여기서 이렇게 생각해볼 수 있음.
-> 스위프트의 문자열은 복사할 때마다 새로운 값 객체를 생성하겠네?
-> 성능적인 비용이 클 수 밖에 없겠네?

근데, 전혀 그렇지 않다.
Swift는 Basic Type, CollectionType에 대해서 COW(Copy on write) 기법을 적용한다. 쉽게 말해 수정이 발생했을 때 복사한다는 것.

Basic Type에는 Int, String, Double
Collection Type에는 Array, Set, Dictionary가 있다.

따라서 객체를 복사했지만, 사본에 아무런 수정이 일어나지 않았다면, 값 타입임에도 불구하고 새로운 객체를 생성하는 것이 아닌, 기존 객체를 재사용한다는 것이다.

## 참고 자료
[Strings, Immutability, and Performance in Dart | by Amirbahrawy | Medium](https://medium.com/@amirbahrawy/strings-immutability-and-performance-in-dart-33081856fb17)
[Understanding Swift Copy-on-Write mechanisms | by Luciano Almeida | Medium](https://medium.com/@lucianoalmeida1/understanding-swift-copy-on-write-mechanisms-52ac31d68f2f)