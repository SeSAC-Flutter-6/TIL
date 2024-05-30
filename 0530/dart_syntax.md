### Collections
- Map
- Set
- List 
  
|        | 순서 | 중복 | 검색 속도 | literal                         |
| ------ | ---- | ---- | --------- | ------------------------------- |
| `List` | o    | o    | 느림      | ```List<int> lists = [1,2,3]``` |
| `Set`  | x   | x    | 빠름      | ```Set<int> sets = {1,2,3}```   |  

*Map의 경우에도 검색 속도가 빠르다  
  
### 스프레드 연산자(Spread Operator)  
dart의 collections는 스프레드 연산자를 제공한다.  
collections의 여러개 값을 간단하게 insert할 수 있음.  
```dart
 List<int> list1 = [1, 2, 3];
  List<int> list2 = [10, 11, 12];
  List<int> addlist = [...list1, ...list2]; // [1,2,3,10,11,12]
```  
* ...? 와 같이 list가 null 일 때는 추가하지 않은 방법으로 에러를 방지할 수 있지만 애초에 list를 null로 두는 일이 거진 없음. 따라서 잘 안쓴다.

### Parameters
```dart
int func(
  int x,  //필수 parameter
  {
  required int a,  //필수ㅇ, null x, named parameter
  int? b, //필수x, null o, named parameter
  int c = 0, //필수 x, null x, named parameter
  } 
) {return 0;}

int func2(
  int x, [int? y] //[] 를 사용하면 optional positional parameter를 사용할 수 있으나 named parameter과 혼재 x
){return 0;}

  func(10, a: 20);
  func(10, a: 20, b: 30);
  func(10, a: 20, b: 30, c: 40);

  func2(100);
  func2(100,200);  
  ``` 


### First-class objects (일급객체)
    일급객체란? 다른 객체들에 일반적으로 적용 가능한 연산을 모두 지원하는 객체를 가리킨다. [위키백과]  
java는 모든 변수, 메서드가 class 하위에 있어야 한다. 따라서 java의 일급객체는 class이다. 변수나 메서드가 일급객체가 될 수 없다.  
dart는 함수가 일급객체로 취급되는데 그게 가능한 이유는 class 하위에 있지 않아도 되기 때문.  
따라서 다음과 같은 것들이 가능하다
 - 함수를 값으로 취급 가능
 - 변수에 함수 대입 가능
 - 다른 함수의 parameter에 함수 자체를 전달 가능  
  
  
### Function? Method?  
| 구분          | Function             | Method                                                                          |
| ------------- | -------------------- | ------------------------------------------------------------------------------- |
| **정의 위치** | 클래스 외부          | 클래스 내부                                                                     |
| **연관성**    | 클래스와 독립적      | 특정 클래스의 인스턴스와 연관                                                   |
| **호출 방식** | 독립적으로 호출      | 클래스의 인스턴스를 통해 호출                                                   |
| **접근성**    | 전역적으로 접근 가능 | 클래스 인스턴스를 통해 접근 가능 (static method는 클래스 이름을 통해 접근 가능) |

- Function 호출 예시
    ```dart 
    int add(int a, int b) {return a + b;}

    void main() {
    int result = add(3, 5);
    }
    ```  
- Method 호출 예시
   ```dart 
    class Calculator { int add(int a, int b) {return a + b;}}

    void main() {
    Calculator cal = Calculator();
    int result = cal.add(3, 5);
    }
    ``` 
