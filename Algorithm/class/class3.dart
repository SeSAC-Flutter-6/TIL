// # 3. 2번의 연습문제의 Car class를 이어서 사용하자.

// - Car class에 named constructor를 추가하자. 이름은 blueSedan이다.
// - blueSedan constructor는 name = ‘sedan’, color = ‘blue’인 객체를 만든다.
// - sedan이란 object와, suv라는 object를 만든다.
// - 생성한 Object의 display method를 호출하여 properties값을 console에 출력하라.

void main() {
  Car sedan = Car(name: 'sedan', color: 'blue', numberOfSeats: 4);
  sedan.display();

  Car suv = Car(name: 'suv', color: 'red', numberOfSeats: 4);
  suv.display();
}

class Car {
  String name;
  String color;
  int numberOfSeats;

  void display() {
    print('name :$name');
    print('color: $color');
    print('numberofSeats: $numberOfSeats');
  }

  Car({required this.name, required this.color, required this.numberOfSeats});

  // Car(this.name, this.color, this.numberOfSeats); -> required 없이 쓴다면
  //Car sedan = Car('sedan', 'blue', 3); 이런식으로 해야 오류가 안난다.
}
