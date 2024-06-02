# Class

Date: 2024년 5월 31일

### 용어 정리

Object: 현실 세계의 모든 객체

Class: Object를 추상화한 형태, 틀

Instance: Class로 생성한 객체, Heap 메모리에 생성됨

### Class와 Instance property의 네이밍 컨벤션(관례적)

| Class | 명사 | Pascal |
| --- | --- | --- |
| Property | 명사 | Camel |
| Method | 동사 | Camel |

### Constructor

```dart
class Person {
    String name;
    int age;

    // 기본적인 생성자 형태. parameter name이 표기되지 않음
    Person(this.name, this.age);

    // named parameter
    Person({
        required this.name,
        required this.age
    });

    // optional positional parameter
    Person({
        this.name = '클레릭'
    })
}

// Swift에서는?

class Person {
    let name: String
    let age: Int

    // named parameter
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // non-named parameter
    init(_ name: String, _ age: Int) { ... }

    // optional positional parameter
    init(name: String = "아무개", age: Int = 27) { ... }
}
```

### 함수와 메서드

함수는 외부 요인에 영향을 받지 않아 같은 Input에는 항상 동일한 Output이 나옴. 함수형 프로그래밍 패러다임의 핵심 원칙

메서드는 Instance에 속하기 때문에 외부 요인(Instace 내 다른 property)에 따라 다른 Output이 나올 수 있음.