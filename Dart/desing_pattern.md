vim version

### 응집도와 결합도
* 응집도
    - 모듈이 하나의 목적을 수행하는 요소들간의 연관성 척도
    - 모듈 내부에서 얼마나 많은 기능들(클래스 호출)이 모여있는지의 척도
* 결합도
    - 모듈이 다른 모듈에 의존하는 정도의 척도
    - 모듈간의 결합 정도

### 의존성 주입 (DI, dependency injection)
* 한 클래스에서 다른 클래스를 호출하여 사용하면 종속성이 높아진다. (=결합도)     
    - 이러한 경우 test하기가 어렵다.
* 이를 보완하기 위해 DI를 사용한다.
* 장점:
    - 유연성과 확장성 향상
    - 테스트 용이성 증가
    - 결합도 감소

### Android에선?
* 의존성 주입을 사용하기 위해 hilt 라이브러리를 사용한다.
* dart처럼 생성자를 통해 di를 사용하면 안되는가?
    - android에서는 activity와 viewmodel에서 생성자를 받을 수 없기 때문에 hilt를 사용하여 의존성 주입을 한다.


### SOLID 원칙
* 단일 책임 원칙 (Single Responsibility principle)
    - 한 클래스는 하나의 책임만 가진다.
* 개방-폐쇄 원칙 (Open/closed principle)
    - 확장에는 열려있으나 변경에는 닫혀있어야 한다.
* 리스코프 치환 원칙(Liskove substitution principle)
    - 객체는 프로그램의 정확성을 해치지 않으며 하위 타입의 인스턴스로 바꿀 수 있어야 한다.
    - 한 마디로 상속 잘해라(Is-a 원칙)
* 인터페이스 분리 원칙 (Interface Segregation principle)
    - 범용 1개보단 여러 인터페이스 사용하자
* 의존관계 역전 원칙 (Dependency Inversion principle)
    - 추상화에 의존하고, 구체화에 의존하지 마라
    - 의존성 주입 사용하면 된다.


### 디자인 패턴
* GoF(Gang of Four)의 디자인 패턴이 있다.
    - 개발을 하다보면 자주 사용하는 패턴을 정형화 한것이다.
    - repository 패턴은 창시자가 없으며 개발자가 사용하다보니 정형화 되었다.
* 생성
    - builder
    - factory
    - singleton
* 구조
    - decorator
    - facade(=repository)
* 행위
    - iterator
    - observer
        - 객체간 일대다 의존성 정의
        - 어떤 객체의 상태가 변화하면 그 객체에 의존하는 다른 객체의 상태도 변한다.
        - android에선 livedata가 예시다.
