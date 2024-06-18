# Day11_예외&파일조작&여러가지 데이터 형식

## 예외(Exception)

<aside>
💡

프로그램을 설계할 때

실행시에 예외 상황이 발생 할 가능성이 있는 것을 예측하여, 사전에 예외 처리가 되도록 할 필요가 있음.

이럴 때 적절한 조치가 없으면 프로그램은 에러가 나며 죽어 버림.

예상 외의 상황에 적절한 조치를 취하는 것을 배운다.

</aside>

### 에러의 종류와 대응책

1. 문법 에러(syntax error)
2. 실행 시 에러(runtime error)
3. 논리 에러(logic error)

### 에러 상황 별 처리

|  | syntax error | runtime error | logic error |
| --- | --- | --- | --- |
| 원인 | 코드의 형식적 오류 | 실행 중에 예상외의 사태가 발생하여 동작이 중지됨
 | 기술한 처리 내용에 논리적인 오류가 있음 |
| 알아 채는 방법 | 컴파일하면 에러 남 | 실행하면 도중에 강제 종료 됨
 | 실행하면 예상외의 값이 나옴
 |
| 해결 방법 | 컴파일러의 지적을 보고 수정 | 에러 | 원인을 스스로 찾아서 해결해야 함 |

### 예외적인 상황들

- 메모리 부족
- 파일을 찾을 수 없음
- 네트워크 통신 불가 등

### 예외 처리의 흐름

```dart
trt {
	//에러가 날 것 같은 코드 작성
} catch (e) {
	// e : 에러의 정보를 담고 있는 객체
}

//tryParse는 형변환 실패시 null 리턴 
 final numString = '10.5';
  int? num = int.tryParse(numString);
  print(num);
```

### 그외 에러처리

```dart
//rethrow 에러 처리를 미룸 
  try {
    someError2();
    print('1');
  } catch (e) {
    print(e);
    print('2');
  }
}

void someError2() {
  try {
    someError();
    print('3');
  } catch (e) {
    print('4');
    rethrow;
  }
}

void someError() {
  throw FormatException('에러가 발생했습니다.');
}
//결과: 4, 2

//on 특정 예외를 캐치 
  try {
    someError2();
  } on TimeoutException {
    print('TimeoutException 발생');
  } on IOException {
    print('IOException 발생');
  } on FormatException {
    print('FormatException 발생');
  }
  //결과: FormatException 발생
  
//finally 항상 해야하는 처리 
  try {
    someError2();
  } on TimeoutException {
    print('TimeoutException 발생');
  } on IOException {
    print('IOException 발생');
  } on FormatException {
    print('FormatException 발생');
  } finally {
    print('무조건 실행되는 코드');
  }
   //결과: FormatException 발생
   //무조건 실행되는 코드
```

## 파일 조작

파일 조작의 기본 순서 

1. 파일을 연다.
2. 파일을 읽거나 쓴다.
3. 파일을 닫는다.

```dart
//dart:io 패키지를 사용 해야 한다.

final file = File('save.txt'); // 파일 열기

// 내용 쓰기(기존에 내용이 있으면 지워지고 새로 써짐)
file.writeAsStringSync('copy 테스트 입니다.');

// 파일 없을시 PathNotFoundException: Cannot open file 에러 발생
final text = file.readAsStringSync();
print(text);// copy 테스트 입니다.
  

//파일 복사 하기 
void main() {
  copy('save.txt', 'copy_save.txt');
}

void copy(String source, String target) {
  final file = File(source);
  final copyfile = File(target);

  copyfile.writeAsStringSync(file.readAsStringSync());
}
```

## 여러가지 데이터 형식

### 직렬화(**Serialization)**

- 데이터 구조나 객체 상태를 저장하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정
- 객체를 파일의 형태 등으로 저장하거나, 통신하기 쉬운 포맷으로 변환하는 과정을 의미
- 클래스 내부의 필드에 다른 클래스가 있다면 모두 직렬화 처리를 해 줘야 함
- 클래스 → json
- jsonEncode() 함수 사용

```dart
//json 으로 직렬화 
class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

	//toJson(): 객체를 Json 형태로 표현하는 메서드 
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}
```

### 역직렬화(Deserialization)

- json → 클래스
- jsonDecode() 함수 사용

```dart

class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

	//fromJson(): json (실제로는 Map) 으로부터 객체를 생성하는 생성자
  Employee.fromJson(Map<String, dynamic> json)
       : name = json['name'].
         email = json['email'];
      
}
```