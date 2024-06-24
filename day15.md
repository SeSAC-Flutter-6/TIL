# Day14_DataSource

### DataSource

- 프로그램이 사용하는 원천 데이터 모든 것이 해당함
- 데이터의 근간이 되는 원천 재료
- DataSource 에서 추출한 가공되지 않은 데이터를 → 사용 가능한 데이터로 변환

### DataSource의 종류

- Text
- 장점 
 1. **단순성**: 설정 및 사용이 매우 간단하며, 기본 텍스트 편집기를 사용하여 열고 수정할 수 있습니다.
 2. 호환성: 거의 모든 운영 체제와 애플리케이션에서 쉽게 읽고 쓸 수 있습니다.
- 단점
 1. **구조 없음**: 데이터가 비구조화되어 있어 특정 데이터를 빠르게 검색하거나 필터링하기 어렵습니다.
 2. **대량 데이터 관리 어려움**: 큰 파일이나 다수의 파일을 관리하는 것이 비효율적입니다.
- File
- 장점
 1. **다양한 형식**: 텍스트, 바이너리, XML, JSON 등 다양한 형식의 파일을 저장할 수 있습니다.
 2. **독립성**: 파일 시스템과 독립적으로 작동하므로 데이터베이스 시스템이 필요 없습니다.
- 단점
 1. **데이터 일관성**: 여러 사용자와 애플리케이션에서 동시에 액세스할 경우 데이터 일관성을 유지하기 어렵다.
 2. **검색 및 성능**: 파일 검색 속도가 느리고, 큰 파일을 처리하는 데 한계가 있습니다.
- Json
 - 장점
 1. **가독성**: 사람이 읽기 쉬운 형식이며, 데이터 구조가 명확합니다.
 2. **유연성**: 다양한 데이터 유형을 포함할 수 있으며, 구조화된 데이터를 표현할 수 있습니다.
- XML
 - 장점
 1. **유연성**: 복잡한 계층 구조와 다양한 데이터 유형을 지원합니다.
 2. **표준화**: 다양한 산업에서 표준으로 사용됩니다.
- 단점
 1. **복잡성**: 구문이 복잡하고 가독성이 떨어질 수 있습니다.
 2. **성능**: JSON에 비해 더 많은 메모리를 사용하며, 파싱 속도가 느릴 수 있습니다.
- CSV
 - 장점
 1. **단순성**: 구조가 매우 간단하고, 텍스트 편집기로 쉽게 열 수 있습니다.
 2. **호환성**: 대부분의 스프레드시트 프로그램 및 데이터베이스에서 지원됩니다.
- 단점
 1. **유연성 부족**: 중첩된 데이터나 복잡한 데이터 구조를 표현하기 어렵습니다.
 2. **유효성 검사**: 데이터의 유효성을 쉽게 검사할 수 없습니다.
- RDBMS
- 장점
 1. **데이터 무결성**: 강력한 데이터 무결성 및 일관성 보장.
 2. **복잡한 쿼리**: SQL을 사용하여 복잡한 쿼리를 작성할 수 있습니다.
- 단점
 1. **유연성 부족**: 데이터 스키마를 사전에 정의해야 하므로, 유연성이 떨어질 수 있습니다.
 2. **확장성**: 대규모 데이터 처리 및 확장성에서 한계가 있을 수 있습니다.
- NoSQL
- 장점
 1. **유연성**: 스키마가 없거나 유연한 스키마를 사용하여 데이터를 저장할 수 있습니다.
 2. **확장성**: 수평 확장이 용이하여 대량의 데이터를 효율적으로 처리할 수 있습니다.
- 단점
 1. **일관성**: 분산 시스템에서 데이터 일관성을 보장하는 것이 어려울 수 있습니다.
 2. **표준화 부족**: SQL처럼 표준화된 쿼리 언어가 없을 수 있습니다.
- 등등

### Json 과 데이터 클래스의 상호 변환

- 서버와 통신을 대부분 JSON으로 함
- 데이터 조작을 쉽게 편하게
- 서버에서 Json 형태의 문자열을 보내주면 Map 으로 변환해야 한다.

```dart
class User {
	final String name;
	final String email;
	
	User(this.name, this.email);
	
	User.fromJson(Map<String, dynamic> json)
			: name = json['name'] as String,
			  email = json['email'] as String;
			  
	Map<String, dynamic> toJson() => {
				'name': name,
				'email' : email,
		};
}

```

### jsonDecode() 함수

- jsonDecode() 함수는 Json String을 Map으로 변경해 주는 함수다.
반대인 jsonEncode()도 있음

```dart
String jsonString = '''
{
	"id": 1,
	"name": "김철수",
	"email": "kim@example.com",
	"age": 30
}
''';
// jsonDecode를 사용하여 JSON 문자열을 Map으로 변환
Map<String, dynamic> jsonData = jsonDecode(jsonString);

// Map의 내용 출력
print(jsonData);
//특정 키의 값 출력
print(jsonData['name']); // 김철수
print(age['age']); // 30
```

### JsonList

```dart
// json List String을 List<모델>로 변경하려면 map() 함수 활용
String jsonListString = '''[
{
	"id": 1,
	"name": "김철수",
	"email": "kim@example.com",
	"age": 30
},
...
]''';
// jsonDecode를 사용하여 JSON 문자열을 Map으로 변환
final jsonList = jsonDecode(jsonListString) as List;
List<User> users = jsonList.map((e) => User.fromJson(jsonList)).toList();
```

### 실제 통신

```dart
// 가장 근본이 되는 라이브러리 http
void main() async {
  http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'))
  .then((response) => jsonDecode(response.body)) // Map<String, dynamic>
  .then((json) => print(json));
}
```

모범 코드

```dart
class TodoDatasource {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todo>> getTodos() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));

    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  Future<Todo> getTodo({required int id}) async {
    final http.Response response = await http.get(Uri.parse('$_baseUrl/$id'));

    final json = jsonDecode(response.body);
    return Todo.fromJson(json);
  }
}
```