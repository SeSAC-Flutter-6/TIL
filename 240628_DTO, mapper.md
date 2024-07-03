# DTO & Mapper
## DTO (Data Transfer Object)
`Json` -> **`DTO`** -> `Model`
- 데이터를 모델 클래스로 변환할 때 사용되는 중간 전달 객체다
- 못된 데이터 소스(예: 잘못된 JSON 데이터)를 받았을 때 애플리케이션이 오류 없이 동작하도록 하기 위한 클라이언트 개발자의 방어 수단

## DTO 코드 예시
### Json 데이터
```json
{
  "userId": 1,
  "id": 1,
  "title": "hahaha",
  "completed": false
}
```
### DTO 코드
```dart
class TodoDto {
  num? userId;
  num? id;
  String? title;
  bool? completed;

  TodoDto({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  TodoDto.fromJson(Map<String, dynamic> json) {
    // JSON 데이터를 객체로 변환하는 로직
  }

  // 선택 사항: 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    // 객체를 JSON으로 변환하는 로직
  }
}
```

### 모델 클래스와 비교하여 어떤 특징이 있는가?

- 모든 필드가 Nullable 변수
- 직렬화, 역직렬화 제공

즉, Json을 무지성으로 받아들인다  
기존 모델 클래스를 Dto가 대체한다

## Dto 만드는 방법
### 1. JsonToDto 플러그인
- 무지성으로 Json을 받아들이기 편한 플러그인
### 2. JsonSerializable  
- fromJson(), toJson() 을 자동으로 생성해 주고
- 필드명을 바꿀 수 있는 것 외에도 DTO, Model을 하나로 합칠 수 있는 여러 기능을 제공한다
- 현업에서 많이 사용하니 사용 방법을 알아둬야 한다  
- 링크: https://docs.flutter.dev/data-and-backend/json#serializing-json-using-code-generation-libraries

