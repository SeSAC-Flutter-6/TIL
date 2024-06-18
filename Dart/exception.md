### Exception

1. 문법 에러
2. 실행 시 에러
3. 논리 에러

- try-catch문으로 에러 잡기
  - throw Exception

```
try {
  someError();
} catch (e) {
  print(e);
}
```

- e는 이상하게 Type이 Object다.

### rethrow

- rethrow의 사용 목적: 예외를 일부 처리한 후, 또는 로그를 남긴 후 상위 호출자에게 예외 처리를 위임하고 싶을 때 사용
- 예외의 연속 처리: 하위 함수에서 발생한 예외를 상위 함수로 전달하여 예외 처리 흐름 유지

```
try {
  someError();
} on FormatException { // 특정 예외 캐치
  print('예외 발생');
} finally {
  print('무조건 실행');
}
```

### 예외 클래스 상속

- API에는 여러가지 예외적 상황을 표현하는 예외 클래스가 준비되어 있다.
- 예외 클래스를 상속하여 오리지날 예외 클래스를 정의할 수 있다.
- toString에서 원하는 메시지로 반환 할수 있다.
