### 인스턴스 조작

- 모든 클래스는 object 클래스의 메서드와 프로퍼티를 가지고 있다.
- toString() -> 일반적으로 generate를 활용하여 모든 필드를 선택 후 활용한다.

### hashcode

- Object를 해쉬 함수를 이용해 숫자로 변환한 값
  - hashcode는 객체를 검색할 때 쉽게 찾을 수 있게 사용함.
  - 일반적으론 객체가 다르면 hashcode가 다르지만 String은 값이 같으면 hashcode가 동일하다.

### sort

- sort의 기본 동작은 compareTo를 이용한다.
  - a > b, a == b, a < b에 따라 return 값이 다름.
  - 이러한 방법을 이용하여 정렬
- compoareTo는 내부 값끼리 비교 가능한 값이 있어야 가능하다.
  - 불가능한 경우 class 내 Comparable<T>를 상속받아 compareTo를 override하여 재정의 한 후 사용하거나
  - `nums.sort((a, b) => a[0].compareTo(b[0]))`와 같이 사용 가능하다.

### copy

- 얕은 복사와 깊은 복사가 있다.
- dart에서는 깊은 복사 기능이 없다. -> 직접 사용
- 기본적으론 ==()와 toString을 상속받아 같은 값의 속성을 가지면 깊은 복사가 된다. (hascode는 당연히 다름)
- 아니면 클래스 내부에 copyWith method를 만들어 복사한다.

```
Person copyWith({
  String? name,
  int? age,
}) {
  return Person(
    name: name ?? this.name,
    age: age ?? this.age,
  );
}
```

### data class(dart.version)

- 아래를 모두 포함시킨(override, 직접구현) class
  - ==()
  - toString()
  - hashcode
  - copyWith
