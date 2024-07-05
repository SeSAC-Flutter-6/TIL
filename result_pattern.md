## Result Pattern

### 서버에 데이터 요청시 예상되는 상황

* 성공
* 실패(Error, Failure)
* 네트워크 연결이 아예 안 되어 있음
* 네트워크 불안정 등으로 타임아웃 발생
  </br>
* 기본적으로 try catch를 활용한 예외 처리 방법이 있지만, 런타임 에러 뿐 아니라 논리적인 오류나 예외상황에 대한 처리를 위해 Result 패턴을 사용하여 성공, 실패 시
  처리를 한다.

### Result class 예시

* sealed class 를 사용한다.

```dart
sealed class Result<T> {
  factory Result.success(T data) = Success;

  factory Result.error(Exception e) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  Success(this.data);
}

class Error<T> implements Result<T> {
  final Exception e;

  Error(this.e);
}
```

* Result 패턴을 사용할 곳에서 응답객체를 Result로 감싼다.
* 예외가 예상되는 지점에 try catch 사용한다.
* switch 문과 조합하여 사용할 때 enum처럼 모든 처리를 강제할 수 있다. (switch 문에서 모든 case 를 작성하지 않으면 에러가 남)

### Freezed 라이브러리

* DTO 가 필요없는 경우 freezed 로 모델클래스를 작성할 수 있다.
* freezed 를 사용하여 Result 클래스를 더 간단하게 만들 수 있다.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T data) = Success;

  const factory Result.error(E error) = Error;
}
```

* 원하는 에러 타입도 정의할 수 있다.

* 예시

    ```dart
    Future<Result<List<Todo>,String>>getTodos();
    ```
  실패시 String 에러메세지 리턴

    ```dart
    Future<Result<List<Todo>,String>>getTodos();
    ```
  실패시 Exception 객체를 리턴
