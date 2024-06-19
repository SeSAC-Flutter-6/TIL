# Day12

# 디버깅

디버깅은 소프트웨어의 오류를 식별하고 수정하는 과정입니다.

### 디버깅 기술

- 로깅
    - 로깅은 코드가 실행되는 동안 발생하는 이벤트를 기록하는 데 사용할 수 있습니다.
- 브레이크포인트
    - 브레이크포인트는 코드의 특정 지점에서 실행을 중지하는 데 사용할 수 있습니다.
- 디버거
    - 디버거는 디버깅을 도와주는 도구입니다. 다양한 기능을 제공하며 디버깅을 더 쉽게 만들 수 있습니다.
- 스택 추적
    - 스택 추적은 호출 스택을 추적하여 코드가 실행 중인 위치를 확인하는 데 사용할 수 있습니다.

### 브레이크 포인트 설정

1. 디버깅할 Dart 파일을 연다.
2. 브레이크포인트를 설정하고자 하는 라인의 번호를 클릭하고 빨간 점이 나타나면 브레이크 보인트가 설정된 것이다.

### 디버그 모드로 실행

1. 안드로이드 스튜디오 상단의 Run 버튼 옆에 Debug 버튼을 클릭하여 디버그 모드로 실행한다.

### 디버그 콘솔 사용

1. 디버그 모드로 실행되면 디버그 창이 자동으로 열린다.
2. 디버그 콘솔 창에서 출력된 로그를 확인할 수 있다.

### 스텝 실행

1. 디버깅 하는 동안 코드를 한 줄씩 실행하거나 함수 호출 내부로 들어가거나 완료하고 나올 수 있다.

# 람다식과 함수

### 고계 함수(higher-order function)

함수를 파라미터로 받는 함수

- where: 조건 필터링
- map: 변환
- forEach: 전체 뺑뺑이
- reduce: 하나씩 줄이기
- fold: 하나씩 접기
- any: 있는지 없는지

```dart
void main() {
  var numbers1 = [1, 2, 3, 4, 5, 6];
  var evenNumbers = numbers1.where((number) => number.isEven);
  print(evenNumbers.toList()); // [2, 4, 6]
  
  var numbers2 = [1, 2, 3];
  var squaredNumbers = numbers2.map((number) => number * number);
  print(squaredNumbers.toList()); // [1, 4, 9]
  
  var fruits = ['apple', 'banana', 'orange'];
  fruits.forEach((fruit) => print(fruit));
  // Output:
  // apple
  // banana
  // orange
  
  var numbers3 = [1, 2, 3, 4];
  var sum = numbers3.reduce((a, b) => a + b);
  print(sum); // 10
  
  
  var numbers4 = [1, 2, 3, 4];
  var sum = numbers4.fold(0, (prev, element) => prev + element);
  print(sum); // 10
  
  
  var numbers5 = [1, 2, 3, 4];
  var hasEvenNumber = numbers5.any((number) => number.isEven);
  print(hasEvenNumber); // true
  
}
```

# 정규표현식(**Regular Expression)**

- 정규표현식은 문자열에서 특정 패턴을 찾고, 일치하는 부분을 추출하거나 대체하는 등의 작업에 매우 유용한도구다.
- 정규표현식은 다양한 특수 문자와 메타문자를 사용하여 복잡한 패턴을 정의할 수 있다.

### 정규표현식 패턴 예제

- .: 임의의 한 문자
- *: 앞의 문자가 0번 이상 반복
- +: 앞의 문자가 1번 이상 반복
- ?: 앞의 문자가 0번 또는 1번 나타남
- \d: 숫자 문자
- \w: 단어 문자 (알파벳, 숫자, 언더스코어)
- \s: 공백 문자
- ^: 문자열의 시작
- $: 문자열의 끝
- []: 문자 클래스 (대괄호 안의 문자들 중 하나)
- (): 그룹화

```dart
void main() {
  //이메일 주소검증 
  String email = 'test@example.com';
  RegExp expEmail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  bool isValidEmail = expEmail.hasMatch(email);
  print(isValidEmail); // true
  
  //전화번호 검증 
  String phoneNumber = '010-1234-5678';
  RegExp expPhoneNumber = RegExp(r'^\d{3}-\d{3,4}-\d{4}$');

  bool isValidPhoneNumber = expPhoneNumber.hasMatch(phoneNumber);
  print(isValidPhoneNumber); // true
}
```

### 정규 표현식의 주요 기능

1. **패턴 매칭**: 문자열 내에서 특정 패턴을 찾음
2. **부분 문자열 추출**: 일치하는 부분 문자열을 추출
3. **문자열 치환**: 일치하는 부분 문자열을 다른 문자열로 치환
4. **패턴 검증**: 문자열이 특정 패턴을 따르는지 검증
