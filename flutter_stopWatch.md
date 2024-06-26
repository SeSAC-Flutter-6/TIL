- Spacer() Widget :  다른 위젯들 사이에서 가변의 공간을 삽입한다
                     flex 속성을 넣을 수 있고 flex: 1,2..등으로 넣으면 비율에 따라 공간을 나누게 된다
                     간단하게 사용가능한 좋은 위젯!!
```dart
const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text('0', style: TextStyle(fontSize: 50),),
    Text('00'),
    ],
),

```
- 위 Row에서 Text '0'은 50 사이즈를 줬고, '00'은 기본 사이즈로 자식 위젯을 정렬하는 키워드
  mainAxisAlignment.center 는 가로축 기준으로 중심에 있게 되고
  crossAxisAlignment.end 는 Row기준으로 세로 축 정렬이라 텍스트 '0'과 '00'은 
  축의 끝부분(하단)으로 정렬이 된다

## ListView
- 여러개의 정보를 나열해서 보여줄 때 쉽고 간편하게 표시 할 수 있다
- ListView의 하위 위젯으로 SizedBox 의 높이와 넓이를 주면 내부에 List 형식으로 Children 갯수 만큼 보여준다

## Timer.periodic(duration, callback)


## 삼항연산자
```dart
   FloatingActionButton(
    onPressed: () {
    setState(() {
      _clickButton();
    });
  },
    child: _isRunning
        ? const Icon(Icons.pause)
        : const Icon(Icons.play_arrow),
),
```
- 실행이 되고 있을 때는 Icons.pause 아이콘 표시, 중지일때는 Icons.play_arrow 아이콘 표시
- setState(){} 를 실행 함수 내에 넣어서 버튼이 눌렸을 때 새로고침을 해줘야 아이콘의 상태가 바뀐다

## padLeft
```dart
  String hundredth = '${_time % 100}'.padLeft(2,'0');
```