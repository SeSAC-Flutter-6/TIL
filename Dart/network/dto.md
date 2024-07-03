### DTO

- 데이터 소스를 모델로 정의해서 만들기 어려운 경우 (예측 type 외 값, null 값, 빠진 값 등)
- DTO : 데이터 소스를 모델 클래스로 변환하는 과정에서 순수하게 클래스에 담기 위한 중간 전달 객체

  - 왜 쓰냐고? 잘못 된 JSON이 들어오더라도 안 터지게하려는 방어 수단

- 직렬화

1. Plugin으로 생성
2. JsonSerializable 설치하여 생성 (JsonSequential, build 설치 필요)

- 사용법이 조금 까다롭다

* 이제부터는 data class 중 fromJson, toJson을 제외하고 만든다.

### Maper

- Dto를 Model 클래스로 변환하는 유틸 메소드.
- extension 으로 분리하여 만들면, 추후 dto (무지성 작성한) 수정이 필요할 때 편리하다
- Nullable 을 non-Nullable로 변환하는 것이 핵심
- Dto 전체를 변환하는 것이 아니다. 필요한 부분만 변환하는 것이다.

### JsonSerializable를 이욯할 때 equatable

- 레거시 코드에서는 https://pub.dev/packages/equatable 처럼 equatable을 extend한 뒤 props를 통해 data class를 정의 해놨다. 참고하자
