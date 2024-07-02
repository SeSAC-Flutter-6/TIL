## DTO, Mapper

### DTO(Data Transfer Object)

* 데이터 소스를 모델 클래스고 변환하는 과정에서 순수하게 클래스에 담기 위한 중간 전달객체

* 잘못된 데이터 소스를 받더라도 터지지 않게 하려는 클라이언트 개발자의 방어 수단

* 모든 필드가 nullable 변수

* 직렬화, 역직렬화 제공

* Json을 무지성으로 받는 모델 클래스를 대체하는 클래스

### DTO가 필요한 이유

* Json 데이터는 문서에 명시되어있지 않더라도 null 값을 포함할 수 있다.

* Map -> Model Class 변환시 null 값 등의 예외를 사전에 걸러내기 용이하다.

* 불완전한 코드가 포함될 것 같다면 Dto를 도입하는게 좋다.

* Json 예외가 없다면 반드시 Dto를 도입할 필요는 없지만, 현실세계에서 100% 확신이란 없다.

### Mapper

DTO를 모델 클래스로 변환하기 위한 mapper

* extension을 활용하여 무지성 DTO와 기능을 분리하여 관리를 편하게 만들자

### Model class

Dto를 사용하여 변화된 Model 클래스 </br>
뷰에서 사용하기 좋은 형태로 한번 더 가공된 클래스

* 모든 필드가 non-nullable 상수
* ==
* hashCode 재정의
* toString() 재정의
* 깊은복사 제공 copyWith()

* Json을 그대로 받지 않고 내 앺에서 필요한 형태로 필드를 수정할 수 있다. 