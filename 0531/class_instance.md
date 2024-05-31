### 클래스와 인스턴스
클래스 : 인스턴스를 생성하기 위한 틀. (쿠키 틀)   
인스턴스 : 클래스로 찍어내어 메모리에 올라간 것. (용사맛 쿠키, 딸기맛 쿠키 ...)  

- 클래스는 메서드와 멤버 변수를 가진다. 
- 클래스를 사용하려면 객체를 생성해야 한다 (new 키워드는 생략 가능)
- 객체를 생성한다는 것은 메모리에 올라간다는 뜻이며 이것이 인스턴스화 이다  
  ```dart
  Hero hero = Hero( name : 용사맛쿠키, hp : 100); //new 는 생략가능
  ```

### 생성자
```dart 
  //constructor
  Hero({required this.name, required this.hp});
  
  //named  constructor
  Hero.epic({required this.name, required this.hp}) {
    hp += 50;
  } 
``` 



  

