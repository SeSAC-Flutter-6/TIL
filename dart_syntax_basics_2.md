# 다트 문법 기초 2

### Collection
- 여러 값을 하나의 변수에 저장할 수 있는 타입
1. List
- 순서대로 쌓여있는 구조. 아이템의 중복을 허용한다.
    ```dart
    List<int> numbers = [1,2,3,4,5];
    ```
- index로 접근할 수 있다.
- 제네릭 안에 타입을 넣는다.
  리스트 안에 리스트, if 문을 넣을 수 있다.

     ```dart
     //스프레드 연산자 '...'
     //리스트 안에 리스트 넣을 수 있음
     //리스트 안에 if 문 넣을 수 있음 (반드시 한줄로 되어있는 if 문)
       bool isRainy = true;
       List<int> numbers = [1, 2, 3, 4, 5, if (isRainy) 6]; //한줄로 되어 있는 if 문만 가능
       List<int> addnumbers = [...numbers, 6, 7];
     ```

2. Set
- 중복값을 허용하지 않는다.
- 검색에 있어 속도가 매우 빠르다.
3. Map
- 키와 값이 쌍으로 저장된다.
- 키의 중복은 불가능하며. 보통 변수타입으로 dynamic을 쓰지 않도록 하지만 Map에서는 dynamic을 쓰기도 한다. key 만 알아도 value에 접근할 수 있다.

     ```dart
     Map<String, dynamic> info = {
    'name' : 'Ann',
     'age' : 20,
    'tall' : 175.3};
     ```

### parameter와 argument
1. parameter
    * 매개변수
    * 함수나 메서드를 정의할 때 사용되는 변수
    * 함수를 실행할 때 외부에서 변수 값을 받도록 만들어 주는 것
2. argument
    * 인자
    * 함수나 메서드를 호출할 때 전달되는 값
3. optional parameter
    * 함수 호출시에는 해당 매개변수에 대한 값(인자)을 전달해야 한다. 만약 값이 있을수도 있고 없을수도 있다면 [ ]를 사용하여 optional parameter로 정의할 수 있다.

    ```dart
    int number(int a, [int b=0]) => a+b;
    ```   

4. named parameter
    * {}를 사용하여 named parameter 을 정의할 수 있다.
    * 기본값은 optional 이며, 매개변수가 필수로 전달되어야 하는 경우 앞에 required 를 쓴다.
    * 순서가 바뀌어도 변수가 변하지 않는다.

### 함수
* 다트에서는 함수도 1급객체로 취급되어 값으로 취급된다.

* 함수의 표현방법

    ```dart
    int number(int a, int b){
    return a * b;}
    ```  

* 람다식 표현

   ```dart
  int number(int a, int b) => a * b;
    ``` 

* where
    * 리스트에서 조건을 만족하는 요소들을 선택하는데 사용.
* map
    * 리스트의 각 요소에 함수를 적용하여 새로운 리스트를 생성하는데 사용
* toList()
    * `Iterable`을 `List`로 변환하는 메서드
* reduce
    * 반복 요소를 줄여가며 결과를 만들때 사용.

    ```dart
    import 'dart:math';

    void main() {
    List<int> numbers = [1, 2, 3, 4, 5];

    print(numbers.reduce((e, v) => max(e, v)));  //가장 큰 수 5
    }
    ``` 
    