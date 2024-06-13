## 다형성

- 공통 기능을 interface로 한군데 모아 사용

```
house.draw();
dog.draw();
car.draw();
```

- 선언을 상위 개념으로 인스턴스 생성은 하위 개념으로 한다.
- 추상적인 선언 = new 상세 정의

  ```
  Charater charater = Hero('홍길동' 100);
  ```

- 뒤의 내용에 집중하자.

```
class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  @override
  void run() {
    print('슬라임 도망침');
  }

  void attack() {
    print('공격');
  }
}

abstract class Monster {
  void run() {
    print('monster');
  }
}

void main() {
  Slime slime = Slime('A');
  Monster monster = Slime('B');
  Monster newMonster = slime;

  // 결과는 모두 slime의 run이 실행된다.
  slime.run();
  monster.run();

  // newMonster는 attack을 모른다.
  slime.attack();
  // newMonster.attack();
}
```
