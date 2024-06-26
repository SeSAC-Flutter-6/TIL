### Const Constructor

- 클래스가 절대 변경되지 않는 객체를 생성하는 경우 이러한 객체를 compile-time constants로 만들 수 있다.
- class 내부 생성자에 const를 붙이고, 호출할 때 const로 호출하면 String처럼 메모리에 값을 적재해놓아 이후 같은 값의 인스턴스는 같은 hashcode를 가진다.

* User의 필드가 모두 final여야 const 붙일 수 있음.

### factory 패턴

- 팩토리 패턴 : 객체를 만들어서 return 한다.
- factory를 붙였다고해서 매번 같은 instance를 주는게 아니다.
- 단순하게 객체를 "내부에서" 만들어서 "return" 해주는거다.

### 싱글톤 패턴

```
class RentCar {
  static final RentCar instance = RentCar._internal();

  RentCar._internal();
}

// 팩토리를 이용하여 가공한 싱글톤
class RentCar2 {
  static final RentCar2 _instance = RentCar2._internal();

  factory RentCar2() {
    return _instance;
  }

  RentCar2._internal();
}
```

- 모두 Singlton 패턴이다.
- 싱글톤 패턴 : 추후 객체를 만들더라도, 어디서든지 1개의 객체만을 바라보기 때문에 필드의 값이 바뀌면 모든 곳에서 다 바뀐다. (= 다 똑같은 객체이다)

- 이제부터 객체의 값 수정이 필요하면 copyWith를 이용하여 통째로 바꾼다.

### Model

- 객체(데이터)에 대한 정보를 가지고 있는(조회하는) 클래스
- 비지니스 로직이 없는 순수한 클래스
- 비슷한 용어들 : 도메인 모델, Entity, DTO, POJO, VO, data class

### 모델링 방법

- DDD (Domain Driven Design)

  - 비지니스 도메인 중심 설계
  - 비지니스 로직의 복잡성을 줄이며 유지보수, 확장성을 높임

- ORM (Object-relational mapping)
  - OOP에서 정의된 객체와 RDBMS의 테이블 간 매핑을 자동으로 처리
  - DB와 상호작용 용이, 코드 재사용성과 유지보수성 높임

### Repository 패턴

- 데이터 저장소에 접근하는 객체를 추상화
  - 확장을 고려하면 Repository를 Interface로 작성하여 추상화한다.
- DataSource와 통신을 담당하는 객체를 캡슐화
- RepositoryImpl에는 비지니스 로직이 들어가 있다.
