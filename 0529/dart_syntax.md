### dart 는 type safety
- 변수의 값이 항상 변수의 정적 타입(static type)과 일치해야 함  
  예를들면 int에는 int만 넣어야 함  
  ```dart
  int a = 1.0; // 불가능
  double b = 1; // 가능하지만 1.0 으로 초기화 됨
  int aa = 5;
  double bb = aa; // 이미 정수로 초기화 된 값은 넣지 못함  
  ```  
- 이런 특성을 해치지 않기 위해 dynamic과 같은 알 수 없는 타입 사용을 지양해야함
  
### dart는 Null safety
- null-related 오류를 방지하기 위한 기능으로, 기본적으로 모든 타입을 non-nullable로 만든다 >> 컴파일 시점에서 오류를 잡아낼 수 있음 
- non-nullable 타입을 쓰면 컴파일 속도도 빨라진다. (계속해서 null 인지 아닌지 체크 하지 않아도 되니까)
<br/>  


### [var] vs [Object] vs [dynamic]
|  | 설명 | 타입 체크 | 접근 |
|-----|-----|-----|-----|
| `var` | 초기 값에 따라 타입이 결정됨 | 컴파일 타임 | 타입에 맞는 메서드 및 프로퍼티 접근 가능
| `Object` | 모든 Dart 객체가 상속받는 최상위 타입 | 컴파일 타임 |타입 캐스팅 후 접근 가능
| `dynamic` | 모든 타입의 값을 허용하지만 컴파일러가 타입 체크를 하지 않음 | 런타임 | 제한 없이 접근 but 에러유발
 ```dart
  var a = 10;     // int로 추론.
  a = 'text'; // error : String을 int에 할당 x

  Object b = 10;  // int 값을 가질 수 있음
  b = 'text';     // String 값도 가질 수 있음.(하지만 타입은 여전히 Object)
  print(b.length); // error : Object 타입으로 length에 접근불가.
  if (b is String) {
    print(b.length); // 타입 캐스팅 후에는 접근 가능
  }
  ```  
  <br/>  

  ### [const] vs [final]
|  | 초기화 | 지연 초기화 | 불변성 |
|-----|-----|-----|-----|
| `const` | 컴파일 타임 상수 | 불가능 | 객체와 그 내부 필드 모두 불변
| `final` | 런타임 상수| 가능 |변수 자체는 불변, 객체의 필드는 변경 가능  
    
<br/>  

### 컴파일 타임과 런타임
- 컴파일 타임  
  고급언어(사람이 쓰는 언어)를 저급언어(기계가 쓰는 언어)로 번역하는 시점  

- 런타임   
  저급언어로 번역된 코드를 받아 실행하는 시점


### 그러면 플러터에서 코드가 어떻게 화면이 될까?
![image](https://github.com/S-YUN/TIL/assets/65701497/380a4052-1a1d-4b2e-b4df-b1ec4e7af9a1)