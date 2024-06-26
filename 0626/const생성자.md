## const 생성자는 왜 쓸까? 

const 생성자를 사용하여 인스턴스를 생성하면, 동일한 값으로 생성된 객체는 동일한 인스턴스로 취급한다.   
즉, const 생성자를 사용하면 컴파일 타임에 객체가 생성되며, 동일한 값을 가진 const 객체들은 동일한 메모리 위치를 공유하게 된다.  

```dart
class User {
  final String name;
  final int id;

  // const 생성자
  const User(this.name, this.id);
}

void main() {
  // 두 개의 const User 객체 생성
  const User user1 = User('김어흥', 1);
  const User user2 = User('김어흥', 1);

  // 객체 비교
  print(user1 == user2); // 출력: true

  // 객체의 메모리 주소 확인
  print(identical(user1, user2)); // 출력: true
    }
```

### 근데 저렇게 해놔도 인스턴스를 생성할때 명시적으로 const를 써줘야 동작함  
- `const` 생성자를 사용하여 객체를 생성할 때는 `const` 키워드를 인스턴스 생성 시에 명시적으로 붙여야 한다
- `const` 키워드가 붙지 않으면, Dart는 `const` 생성자를 사용해도 동일한 메모리 최적화를 적용하지 않음  

```dart 
void main() {
  // const 키워드 사용
  const User user1 = User('김어흥', 1);
  const User user2 = User('김어흥', 1);

  print(user1 == user2); // 출력: true
  print(identical(user1, user2)); // 출력: true

  // const 키워드를 사용하지 않은 경우
  User user3 = User('이야옹', 2);
  User user4 = User('이야옹', 2);

  print(user3 == user4); // 출력: false
  print(identical(user3, user4)); // 출력: false
}
```
근데 사실 동등성 재정의를 할거면 필요없음 