# day13_비동기 프로그래밍

## 동기(sync) 프로그래밍

- 코드가 순서대로 실행된다.
- 작업이 완료될 때 까지 프로그램이 중단될 수 없다.
- 모든 작업은 이전 작업의 실행이 완료될 때까지 기다려야 한다.

## 비동기(async) 프로그래밍

- 임이의 순서로 또는 동시에 작업이 실행될 수 있다.
- 비동기를 처리하는 방법에는 콜백, Future, async - await 방식이 있다.
- 작업이 완료될 때까지 기다리지 않고 다음 작업을 계속 진행한다.
- 대기하고 싶은 비동기 함수를 실행할 때 await 키워드를 사용해주면 코드를 작성한 순서대로 실행 된다.

```dart
void main() async {
  print('이름찾는중...');
  
  var name = await getName();
  //2초후 출력
  print('이름은 $name');
}

Future<String> getName() async {
  // 2초 대기
  await Future.delayed(Duration(seconds: 2));
  return '홍길동';
}
```

### 콜백 함수

> 콜백은 함수를 인자로 전달하여 특정 조건에서 호출되는 방식이다.
> 
> 
> 비동기는 결과를 기다리지 않고 다음 코드를 실행하는 기법이다.
> 
> 이는 자원을 효율적으로 사용하지만, 순서를 지키는 것이 중요하다.
> 
> 비동기 코드를 순차적으로 실행하는 일반적인 방법은 콜백이다. (Java)
> 
> Dart에서는 async-await를 사용하여 순차적 코드를 더욱 깔끔하게 작성할 수 있다.
> 
> 콜백의 실세계 예: 음식을 주문하고 진동벨을 가지고 기다린다. 음식이 준비되면 고객이 호출된다.
> 

## Future

- 미래에 완료되는 객체
- 미래에 받아올 값을 의미
- 비동기 작업을 표현하는 클래스
- 결과를 반환하거나 오류를 발생시킨다 (then, catchError)
- whenComplete() 는 성공,실패 관계없이 실행된다.

```dart
//예외 처리의 정석 
Future<String> getData() async {
  try {
    // 데이터를 가져오는 비동기 작업
    var data = await _getDataFromAPI();
    return data;
  } catch (error) {
    //데이터를 가져오는데 실패했을 때 처리 
    print('데이터를 가져오는 데 실패했습니다: $error');
    return '';
  }
  //whenComplete() 추가하면 성공,실패 관계없이 실행된다.
}

//여러 비동기 작업을 병렬로 처리하고, 모든 작업이 완료될 때까지 기다리는 경우
Future<String> fetchData1() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data 1';
}

Future<String> fetchData2() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Data 2';
}

Future<void> main() async {
  print('Data 가져오는중...');
  try {
    List<String> results = await Future.wait([fetchData1(), fetchData2()]);
    print('모든데이터 수신 완료: $results');
  } catch (error) {
    print('Error: $error');
  } 
 }

```

### 정리

1. 비동기를 다루는 방법을 모두 말 할 수 있어야 한다.
2. await 키워드 뒤에는 반드시 Future 타입이 와야 한다.
3. await 키워드는 async 키워드가 있는 함수에서만 사용할 수 있다.
4. 에러처리나 가독성, 처리상황에 따라 적절한 코드를 잘 선택할 수 있어야 한다.

```dart
//에러 처리하기 쉬운 형태
Future<bool> fileContainsBear(String path) async {
  var contents = await File(path).readAsString();
  return contents.contains('bear');
}
```