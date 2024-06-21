## 동기 프로그래밍

* 코드가 순서대로 실행된다.
* 작업이 완료될 때까지 프로그램이 중단될 수 없다.
* 모든 작업은 이전 작업의 실행이 완료될 때까지 기다려야 한다.

## 비동기 프로그래밍

* 임의의 순서로 또는 동시에 작업이 실행 될 수 있다.
* 콜백, Future, async-await

### 콜백

* 함수를 다른 함수의 인자로 전달하고, 해당 함수가 완료되면 호출되는 메커니즘.
* 다트는 함수를 변수로 전달하여 실행 가능하기때문에 콜백 구현 가능
* 비동기 코드를 순서대로 실행하기 위한 방안 중 하나.
* 함수의 실행 순서가 보장되고 예상대로 잘 동작하지만 단계가 거듭될수록 콜백지옥에 빠질 수 있다.

### Future

* 미래에 완료되는 객체
* `Future<String>`이면 String 타입이 아닌 미래에 받을 String 타입이다.
* Future 함수의 결과는 then()을 통해 받을 수 있다.
* 다음코드가 Future 이라면 계속해서 then()을 이어서 결과를 전달 받을 수 있다.
* 불필요한 인자는 `_`을 쓴다.

```dart

final user = {
'email' : 'abc@abc.com',
'password' : '123456',
'name' : 'John Doc'
.
};

saveDb
(
user)
    .then((_)) => sendEmail(user))
    .then((_)) => getResult(user))
    .then((value) => print(value));
```

### async - await

* await 를 사용해 작성한 순서대로 시행되도록 할 수 있다. (기다리는 동안 cpu가 노는게 아니라 다른작업 가능하다.)
* await 는 Future 을 리턴해주는 함수에만 사용 가능하다.
* 해당 Future가 끝날때까 함수의 실행을 기다린다.
* 비동기 코드를 작성할 때 더 깔끔한 코드를 제공한다.

```dart
Future<String> getName() async {
  // Future<String> 하면 일반함수처럼 쓸 수 없고, Future 라는 다른 객체
  await Future.delayed(Duration(seconds: 2)); // await 를 쓰지 않으면 '홍길동'을 먼저 리턴함
  return '홍길동';
}
```

#### timeOut()

* 타임아웃함수의 여러가지 예시
* https://api.dart.dev/stable/3.4.4/dart-async/Future/timeout.html

