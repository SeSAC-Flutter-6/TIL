### ForEach

- dart에서는 forEach가 실수(버그)를 일으킬 수 있기 때문에 lint에서 난리가 난다.
- 어떤 버그냐 하면

```
bool g(List<int> list) {
  list.forEach((i) {
    if (i == 42) {
      return true;
    }
  });
  return false;
}
```

- 위 코드는 forEach 내부에서 return을 하고 있기 때문에 g라는 함수는 항상 false를 return 하게 된다.

### Generic

타입을 나중에 원하는 형태로 정의 가능
E : Elment
T : Type
K : Key
V : Value

- List<E> class
- Map<K,V> class

```
class Pocket<E extends Book> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    return _Data;
  }
}
```

### Enum

```
enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int count;

  const KeyType(this.count);
}

```

## String

- identical(a, b)
  - a, b가 같은 메모리에 있는지 bool으로 return
- String인 2개의 인스턴스가 값이 같으면 identical은 true
  - String은 내부적으로 1번 만들어 놓은 애들을 관리한다.
  - 1번 사용한 애들은 String pool에서 재사용한다.
  - 그렇기 때문에 메모리가 동일하다.

### Dart에선 String은 final class(불변!!)다.

- 기존에 선언한 String instance의 값이 바뀌면, 새로운 instance가 계속 만들어진다.
  - 값이 바뀌고, 이전에 사용했던 String 값은 garbage collector이 청소한다.

### StringBuffer

- String과 다르게, 기존에 알고있던 상식처럼 기존 메모리에 값만 변경시켜준다.
  - String에 비해 값이 변경될 때 빠르다.

### 메모리

- box2는 box1의 메모리를 가르키고 있기 때문에 box1이 변하면 box2도 변한다.

```
Rectangle box1 = Rectangle(5, 10, 60, 90);
Rectangle box2 = box1;
box1.translate(100, 100);

box1.x = ?
box2.x = ?
```
