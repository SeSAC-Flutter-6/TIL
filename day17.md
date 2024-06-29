# Day17_Dto_Mapper

### DTO 가 필요한 이유

- Map -> Model Class 변환시 null 값 등의 예외를 사전에 걸러내기 용이함
- 데이터 소스를 모델 클래스로 변환하는 과정에서 순수하게 클래스에 담기 위한 중간 전달 객체
- 잘못된 데이터 소스(Json)를 받더라도 안 터지게 하려는 클라이언트 개발자의 방어 수단
- 서버 개발이 정말 완벽하다면 사용안해도 된다

### DTO 특징

- 모든 필드가 Nullable 변수
- 직렬화, 역직렬화 제공
- Json을 무지성으로 받아들인다

### Model 특징

- 모든 필드가 non-nullable 상수
- 데이터 소스의 모양을 확인하지 않고 미리 정의할 수 있음
- Json을 그냥 받지 않고 내 앱에서 필요한 형태로 필드를 수정할 수 있음
- Dto를 모델로 변환해서 사용해야 함

### Mapper 특징

- DTO를 Model 클래스로 변환하는 유틸 메소드이다
- extension 확장함수 활용 (추천)
- Nullable 값을 Non-nullable로 변환하여 사용하기 편리하게 함

```dart
//key 값이 없어도 null
extension TodoMapper on TodoDto {
	Todo toTodo() {
		return Todo(
			userId: userId?.toInt() ?? -1,
			id: id?.toInt() ?? -1,
			title: title ?? '제목 없음',
			completed: completed ?? false,
		);
	}
}
```

### 데이터 흐름

1. Json 데이터 수신: 서버로부터 JSON 데이터를 수신
2. DTO 변환: JSON 데이터를 DTO로 변환하여 데이터 유효성 검사
3. Mapper 사용: DTO를 Model 클래스로 변환 
4. Model 클래스 사용: 변환된 Model 클래스를 사용하여 비즈니스 로직을 수행
