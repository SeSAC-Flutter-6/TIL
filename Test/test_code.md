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
