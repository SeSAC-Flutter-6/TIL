# Day5_캡슐화&컬렉션

# 캡술화(Encapsulation)

## 접근 지정자(access modifier)

| 제한범위 | 명칭 | 설정 방법 | 접근 가능한 범위 |
| --- | --- | --- | --- |
| 제한이 엄격 | private | 멤버 앞에 _붙이기 | 자기 자신의 클래스 |
| 제한이 느슨 | public | 기본 값 | 모든 클래스 |

## getter 와 setter

- 메소드를 경유한 필드 조작 
- getter: 읽기 전용 프로퍼티를 구현할 때 사용
- setter: 쓰기 전용 프로퍼티를 구현할 때 사용

```dart
String name; // getter, setter 다 허용 
int _hp;
int get hp => _hp; // getter

String get name => _name;

set name(String value) { //setter
 
 }
 
 // 클래스에 대한 액세스 제어
 // 함수, 변수와 동일한 규칙
 class A {} 
 class _B {}
```

## 캡슐화에 대한 생각

개발자의 잘못된 접근에 대한 제어 방법을 제공

# 컬렉션

1. List: 순서 대로 쌓여있는 구조(아이템의 중복 허용)
2. Map:  키(key)와 값(value)의 쌍으로 저장 (키의 중복 불가)
3. Set: 순서가 없는 집합(중복 불가)

## 컬렉션 선택

- key, value 쌍 : Map
- 중복 가능 : List
- 중복 불가 :  Set
- 순서 중요 : List
- 순서 안 중요 : Set
- 검색 속도 중요 : Set