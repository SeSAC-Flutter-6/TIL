## 레퍼런스 타입과 참조

- 가상세계 = 컴퓨터의 메모리 영역
- 인스턴스 = heap 영역 안에 확보된 메모리
- 전역변수, 지역변수 별로 Memory 상에 할당되는 영역이 다르다.
- dart는 모든 타입이 레퍼런스 타입

![alt text](image.png)

```
final hero = Hero(hp: 100);
final hero2 = hero;
hero2.hp = 200;
print(hero.hp);
// result : 200
```
