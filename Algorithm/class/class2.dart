// # 2. 다음 요구사항에 맞는 Car class를 만들어라.

// - name, color, numberOfSeats를 properties로 갖는다.
// - 모든 properties 값을 출력하는 method display 를 정의해라.
// - 모든 properties를 필수로 초기화하도록 constructor를 정의하라.
// - sedan이란 object와, suv obejct를 만들자.
// - 생성한 Object display method를 호출하여 properies값을 console에 출력하라.

// Hint

// -constructor의 parameter 구조는 자유롭게 해도된다.

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
