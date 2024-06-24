### jsonDecode() 
jsonDecode() 함수는 **JSON 형식의 문자열**을 Dart의 객체로 변환해주는 함수. 이 함수는 JSON 데이터를 Dart에서 사용할 수 있는 Map이나 List와 같은 객체로 변환해줌  
코드를 까고 들어가면  
```dart 
dynamic jsonDecode(String source,
        {Object? reviver(Object? key, Object? value)?})
```
return이 dynamic인걸 볼 수 있다. 그런데 주로 Map<String, dynamic> 형태나 List<dynamic> 형태가 많다.   
```dart 
 // JSON 형식의 문자열
  String jsonString = '{"name": "John", "age": 30, "isStudent": true}';

  // jsonDecode() 함수를 통해 JSON 문자열을 Map<String, dynamic> 객체로 변환
  Map<String, dynamic> userData = jsonDecode(jsonString);

   // JSON 배열 형식의 문자열
  String jsonArrayString = '[{"name": "John", "age": 30}, {"name": "Alice", "age": 25}]';

  // jsonDecode() 함수를 통해 JSON 배열을 List<dynamic> 객체로 변환
  List<dynamic> usersData = jsonDecode(jsonArrayString); 
  ```

  그런데 후자의 경우엔 map()을 활용하는게 더 일반적인듯 -> 그러기 위해서 모델 클래스가 필요
  ```dart 
  import 'dart:convert';

void main() {
  // JSON 배열 형식의 문자열
  String jsonArrayString = '[{"name": "John", "age": 30}, {"name": "Alice", "age": 25}]';

  // map() 메서드를 사용하여 각 요소를 변환하고 처리
  List<User> users = usersData.map((userData) => User.fromJson(userData)).toList();
}

class User {
  String name;
  int age;

  User({required this.name, required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
    );
  }
}
```


