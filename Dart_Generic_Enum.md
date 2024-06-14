published: 2024-06-14

## 배운 것

### 제네릭 문법.
Class 내부에서 사용할 타입을 추상화할 수 있다. 
즉, 타입을 나중에 정하기로 하고 사용한다는 것.
사실 `List<E>` , `Map<K, V>` 와 같은 컬렉션을 선언할 때부터 우리는 이미 제네릭을 사용하고 있었음.
List가 배열의 요소 타입을 제네릭으로 받도록 구현되어 있음.
```dart
abstract interface class List<E> implements Iterable<E>, _ListIterable<E> {
... 
}

```

한 가지 유의해야할 점이 있음.
타입을 제네릭으로 

## 느낀 점 

## 참고 자료