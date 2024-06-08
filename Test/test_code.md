### Test Code의 Exception

```
test('throwError should throw MyCustomException when shouldThrow is true', () {
    expect(() => throwError(true), throwsA(isA<MyCustomException>()));
  });

  test('throwError should not throw MyCustomException when shouldThrow is false', () {
    expect(() => throwError(false), returnsNormally);
  });
```

- throwsA(isA<MyCustomException>()): 특정 타입의 예외가 던져지는지 확인합니다.
- returnsNormally: 예외가 던져지지 않는지 확인합니다.
- throwsA(predicate(...)): 예외의 타입과 메시지를 함께 확인합니다.

### Matcher

- setUp : group화 하여도 test Code 실행시 다시 실행
- setUpAll : test code가 다시 실행되어도 1번만 실행 됨.

```
setUpAll(() {
  cleric = Cleric(name: '기본성직자');
});
```
