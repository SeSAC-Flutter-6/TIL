## Result

### Result 쓰는 이유

- 예외는 try - catch를 이용하나 런타임 에러 뿐만 아니라 논리적인 오류나 예외 상황에 대한 처리를 하기에는 부족
- 명확성
- 통일된 인터페이스
- throw가 아닌 값으로 표현하여 예외 발생 시 앱을 터지게하는게 아닌 값을 표기하려고

### 어디서?

- result는 repository에서
- datasoruce에서 쓰면 계속 result로 return해서 번거롭다.

### 생성 방법 및 사용 방법

- 원래 생성 방식
- sealed 클래스는 타입 봉인 효과를 가진다 (enum 하고 비슷한 효과 + 다른 객체의 참조를 가질 수 있다)
- https://dart.dev/language/class-modifiers#sealed

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

```dart
class PhotoRepositoryImpl implements PhotoRepository {

  @override
  Future<Result<List<Photo>, ErrorList>> getPhotos(String query) async {
    try {
      final photoDto = await _imageSearchApi.getPhotos(query);
      return Result.success(photoDto.map((dto) => dto.toPhoto()).toList());
    } on TimeoutException {
      return Result.error(ErrorList.requestTimeout);
    } catch (e) {
      return Result.error(ErrorList.unknown);
    }
  }
}

```

### freezed를 쓰자

- freezed = json_serializable + Equatable + Immutable 합친 것
- https://pub.dev/packages/freezed
- 기존의 data class + fromJson, toJson 구현
  - 기존 자동 구현과는 다르게, List 원소 또한 비교

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<D, E> with _$Result<D, E> {
  const factory Result.success(D data) = Success;

  const factory Result.error(E error) = Error;
}
```

### model에서도 활용이 가능하다.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required int id,
    required String pageURL,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
```
