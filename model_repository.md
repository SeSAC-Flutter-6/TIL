## model class

* 표현할 객체
* 메서드는 없다.
* 데이터를 안전하게 담는 역할을 하는 클래스
* 작성시 final을 쓰는게 좋다.

## factory 생성자

* 객체를 만들어서 리턴한다. 같은걸 줄지 다른 걸 줄지는 내 마음이다.
* 안쪽에서 작업을 하고 리턴을 하는 느낌. `{}`안쪽에 코드를 작성하여 리턴 할 수 있다. 생성자 내부에서 조건에 따라 객체를 생성하고 반환한다.
* factory 생성자 사용시 생성자에 이름을 주는게 나중에 헷갈리지 않는다. 나중에서 인스턴스 만들때 기본 생성자인지 구분할 수 없다.
* initializer list가 생성을 하면서 리턴하는 느낌이라면 factory 는 생성을 해서 리턴하는 것이라고 볼 수 있을 것 같다. (만들고 리턴)

## Singleton 패턴

* 1개의 인스턴스만 생성되는 것을 보증하기 위한 패턴. 인스턴스 생성을 여러번 시도해도 1개의 인스턴스가 공유된다.
* 이 패턴을 통해 애플리케이션 전역에서 동일한 인스턴스를 사용합니다.
* factory 키워드가 사용된다.

```dart
class RentCar {
  static final RentCar _instance = RentCar._internal();
  int _count = 0;

  factory RentCar() {
    return _instance;
  }

  RentCar._internal();

  int increment() {
    return ++_count;
  }
}

void main() {
  final instancel = RentCar();
  final instance2 = RentCar();
  print(instancel == instance2); // true
}
```

## repository

* 소프트웨어 개발에서 데이터 저장소에 접근하는 객체를 추상화하고, 데이터소스와의 통신을 담당하는 객체를 캡슐화하는 디자인 패턴
* 비즈니스 로직고 데이터를 분리함으로써 여러가지 이점을 가져갈 수 있다.
    * 유지 관리성 향상
    * 재사용성 향상
    * 테스트 용이성 향상
    * 확장성 향상
    * 데이터 액세스 추상화

* repository 인터페이스
    * 객체지향 프로그래밍의 다형성을 잘 활용한 예이다.
    * 확장성을 위해 사용한다. 
