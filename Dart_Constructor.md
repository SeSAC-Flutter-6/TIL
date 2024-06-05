# 클래스 - 레퍼런스 타입과 참조

Date: 2024년 6월 4일

Cleric Class 코드 피드백

주석 최소한. 변수, 함수, 클래스 이름을 약자 대신 구체적으로 적기.

Magic number는 상수를 적극적으로 활용

Test할 때 group 활용 시 setup, setupAll을 활용할 수 있음.

## 레퍼런스 타입

Dart는 모든 타입이 Reference Type, Primitive type(원시형 타입)도 Reference Type이다.

즉, 모든 타입은 Heap 메모리에 인스턴스가 생성되고 Stack 메모리에서는 Heap 메모리에 저장된 객체의 주솟값을 참조한다.

## Constructors

1. constant constructors
    
    객체가 컴파일 타임 상수로 생성된다.
    
    ```dart
    class ImmutablePoint {
    	static const ImmutablePoint origin = ImmutablePoint(0, 0);
    	
    	final double x, y;
    	
    	const ImmutablePoint(this.x, this.y);
    }
    ```
    
2. initializer list
    
    생성자 블럭이 실행되기 전에 초기화할 수 있음.
    
    ```dart
    Point.fromJson(Map<String, double> json)
    	: x = json['x']!,
    		y = json['y']! {
    	print('In Point.fromJson(): ($x, $y)');
    }
    ```
    

3. over-loading non-supported

Dart는 오버로딩을 지원하지 않는다.

## Test

```dart
group('selfAid()', () {
    test('hp는 최대치로 회복한다', () {
      final cleric = Cleric(name: '클레릭');

      cleric.selfAid();

      expect(cleric.hp, equals(Cleric.maxHp));
    });

    test('mp가 cost보다 낮다면 hp는 변하지 않는다', () {
      final cleric = Cleric(name: '클레릭', mp: 0);

      final lastHp = cleric.hp;

      cleric.selfAid();

      expect(cleric.hp, equals(lastHp));
    });
}
```

group으로 테스트 블럭을 의미론적으로 그룹화할 수 있음.

group 내에서 setup, setupAll 등으로 사전에 인스턴스를 초기화할 수 있음.