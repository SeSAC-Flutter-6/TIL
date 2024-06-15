# Day10_제네렉&열거형

## 제네릭

### 타입이 없을때의 문제점

- 런타임 에러가 나기 쉽다.
- IDE가 컴파일 에러를 미리 찾을 수 없다.
- 타입을 나중에 원하는 형태로 정의 할 수 있다.

```dart
//타입 안전(type safe) 효과
List<E> class
Map<K, V> class
```

### 제네릭을 사용하지 않은 클래스

```dart
class Pocket {
	Object? _data;

	void put(Object data) {
		_data = data;
	}
	Object? get() {
		return _data;
	}
}
```

### 제네릭을 사용한 클래스

```dart
class Pocket<E> {
	E? _data;

	void put(E data) {
		_data = data;
	}
	E? get() {
		return _data;
	}
}
```

### 제네릭에 이용가능한 타입 제약을 추가한 클래스

```dart
class Pocket<E extends Book> {
	E? _data;

	void put(E data) {
		_data = data;
	}
	E? get() {
		return _data;
	}
}
```

---

## 열거형(enum)

정해 둔 값만 넣어둘 수 있는 타입

### enum 사용 X

```dart
//로그인 상태를 나타내는 상수를 정의한 예
class AuthState {
	static const authenticated = 1;
	static const unauthenticated = 2;
	static const unknown = 3;
	
	int authState = AuthState.unknown;
	
	//휴먼 에러 유발 
  if (authState == AuthState.authenticated) {
    print('인증 됨');
  } else if (authState == AuthState.unauthenticated) {
    print('미인증');
  } else {
    print('알 수 없음');
  }
  
}
```

### enum 사용 O

```dart
enum AuthState {
  authenticated,
  unauthenticated,
  unknown,
}

  AuthState authState = AuthState.unknown;

//switch와의 조합으로 모든 케이스를 강제로 작성해야 된다. (휴먼에러 방지)
  switch (authState) {
    case AuthState.authenticated:
      print('authenticated');
    case AuthState.unauthenticated:
      print('unauthenticated');
    case AuthState.unknown:
      print('unknown');
  }
```