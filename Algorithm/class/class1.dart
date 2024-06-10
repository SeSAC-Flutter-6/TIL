// # 1. Q. 다음 요구사항에 맞는 Home class를 만들어라.

// - name, address, numberOfRooms를 properties로 갖는다.
// - 모든 properties 값을 출력하는 method display를 정의해라.
// - Home의 Object를 만들고, 각 Property에 값을 할당해라.
// - 생성한 Object의 display method를 호출하여 properties값을 console에 출력하라.

void main() {
  //Home()이라는 default constructor를 호출하는 것 -> home타입 객체가 만들어 진다.
  Home home = Home();
  home.name = 'kim';
  home.address = 'seoul';
  home.numberOfRooms = 4;
  home.display();
}

class Home {
  String? name;
  String? address;
  int? numberOfRooms;

  void display() {
    print('name: $name');
    print('address: $address');
    print('numberOfRooms: $numberOfRooms');
  }

  // Home(this.name, this.address, this.numberOfRooms);
}
//초기값을 준다.
//nullable 변수로 만든다.
//Constructor를 이용해서 초기화 할수 있도록 한다.
