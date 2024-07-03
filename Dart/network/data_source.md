### Data Source

- 프로그램이 사용하는 원천 데이터 모든 것
- DataSource 에서 추출한 가공되지 않은 데이터 -> 사용 가능한 데이터로 변환

- 서버에서 보내는 문자열 형태의 Json을 Dart의 Map 형태로 변환해야함.

  - jsonDecode(Str)

- 그런데, 공공 데이터 활용에선 Xml이나 csv타입의 데이터가 주어질 수 있기 때문에 이 또한 활용하는 방법을 알아야 한다.

- dart에서 xml, faster-csv 등 parsing에 도움되는 라이브러리들이 존재한다.
  - 대용량 데이터의 경우 json 형태면 메모리 절약을 위해 csv 파일로 존재할 수 있다.
  - csv 파일로 가져오되, json 형태로 가공하여 사용해도 된다.

### HTTP

- dart에서 http 라이브러리를 이용해 통신이 가능하다.

```
  Future<List<Todo>> getTodos() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    List jsonList = jsonDecode(response.body);

    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }
```
