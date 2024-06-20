## 비동기

- 비동기를 처리하는 방법에는 콜백, Future, async - await 방식이 있다.

### Future

- 미래에 완료되는 객체

```
Future<String> getName() async {
  Future.delayed(Duration(seconds: 1));

  return '홍길동';
}
```

- return type이 Future<String>이기 때문에 await를 붙이면 String으로 바뀐다.

```
var delay = Future.delayed(Duration(seconds: 5)); // Type : Future<dynamic>
```

- future 함수는 본문 앞에 async를 붙여야 한다.
- 대기하고 싶은 비동기 함수를 실행할 때 await 키워드를 사용해주면 코드를 작성한 순서대로 실행된다.

```
Future<String> timeoutFuture() async {
  return await Future.delayed(
    Duration(seconds: 6), () {
      return 'ok';
    },
  ).timeout(
    Duration(seconds: 5),
    onTimeout: () => 'timeout',
  );
}
```

- Future 함수는 결과를 then() 함수를 통해서 받을 수 있다.
- then() 함수로 전달되는 콜백 함수에 다음에 실행할 코드를 작성하면 된다.

```
saveDb(user)
  .then((_) => sendEmail(user));
```

- Future 예외처리는 catchError()를 쓰면 되나, 대게 try-catch를 사용한다.
- whenComplete(() => {})는 성공, 실패 관계없이 실행된다.
- then은 콜백보단 편하지만 동기식 코드보다는 결과 예측이 어렵다.
  - async - await를 사용하면 깔끔한 코드를 제공한다.

### 정리

1. 비동기를 다루는 방법을 모두 말 할 수 있어야 한다.
2. await 키워드 뒤에는 반드시 Future 타입이 와야 한다.
3. await 키워드는 async 키워드가 있는 함수에서만 사용할 수 있다.
4. 에러처리나 가독성, 처리상황에 따라 적절한 코드를 잘 선택할 수 있어야 한다.
