## Form

- Form은 form키를 사용할 수 있다
- ```dart
  form키는 final _formKey = GlobalKey<FomState> 로 선언 후
  key: 로 접근 가능하다

- ```
- ```dart
  if(_formKey.currentState?.validate() ?? false) {}

- ```

## TextFormField

- keyboardType 으로 키보드타입을 제한할 수 있다(number, text등..)
- validator:(value) {} 로 들어 오는 값을 판단 해서 조건식을 걸수도 있다
- form키와 validate를 이용해서 elevatedButton등에 판정식을 넣을 수도 있다
- onChanged(value){} 함수를 사용하면 값이 변할때마다 저장해 놓을 수가 있다

```dart
            TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '몸무게를 입력해주세요';
                  }

                  return null;
                },
                onChanged: (value) => save(),
              ),

```

## stless vs stful

- 화면의 변경이 있을 화면 위젯 : stful
- 화면의 변경이 없을 화면 위젯 : stless (움직이지 않는 화명이 성능상 이점이 있다)

## Live Templates

- window - file - settings - live templates

ex)

```dart
  Navigator.push
   (
    context,
    MaterialPageRoute(builder:
  (context) => $targetRoutes$(
   )
  ),
);

```

$targetRoutes$ - 이렇게 하면 변수처럼 사용하면 된다

## const

- const는 위젯내 변수가 있으면 const를 붙이지 말고
  없다면 붙이자. 성능상 이점이 있다
- List같은 배열에 각 위젯에 const를 붙이면 상위 위젯은 list에 const를 붙이라고 뜨고
  붙인다면, 하위 위젯에서는 const를 붙일 필요는 없다

## final height = _heightController.text;

- 강의 영상에서 ElevatedButton 내에 넣으라고 했지만 바로 다음영상에서 사라진다
  사라져도 상관없는 코드인가?(중복코드 혹은 사용하지 않는 코드라고 하던데)

## shared preferences.

- 앱이 종료 되어도 값을 저장(Write) 해 놓고 다시 앱을 실행했을때 그 값을 읽어(Read) 올 수 있는 패키지
  ```dart

Future save() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('height', double.parse(_heightController.text));
  await prefs.setDouble('weight', double.parse(_weightController.text));
}

dispose() {
 save();
  ...
 //dispose 하기전에 save()를 실행해서 저장하고 있으라고 하는 명령어
 //하지만 dispose가 다 끝나기 전에 꼭 save() 메서드가 실행된다는 보장은 없고 끝나버릴 수도 있다.
}
- ```
- 저장하는 기능을 하나의 메서드로 작성 
  
- 그래서 안전하게 화면을 넘기는 ElevatedButton 중간에 save(); 메서드를 넣으면 화면은 넘어가더라도
  늦지만 메서드는 작동을 하고 앱이 종료 되기 전에 끝날 확률이 높은 하나의 방법이다

```dart
Future load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
      print('키 : $height, 몸무게 : $weight');
    }
  }

```
- load() 메서드도 하나 만들어서 저장과 불러오기를 할 수 있고, 불러오는 future 함수에서는 getDouble이 
  future 함수를 리턴하지 않기 때문에, await을 안써도 된다.
- 저장할 때 'height', 'weight' 는 key로 사용되고 key에는 'double.parse..'값이 저장이 되어있고
  그 key를 다시 불러오면 'double.parse..' 값을 로딩 할 수 있게 된다
- 여기서 double?은 아무값도 안들어 올 수 있는데, 값이 들어오기 전에 로딩을 먼저 할 수도 있기 때문이다
- parse대신 tryParse를 이용하면 ?? 일때 값을 설정 해놓을 수 있어서 값이 없어지는 에러를 방지할 수 있다
  
```dart
@override
  void initState() {
    super.initState();

    load();
  }
```

- 그래서 initState를 호출해서 가장 처음에 앱이 실행됐을때 값을 로딩할 수 있는데, 여기에 값이 저장되어 있는
  load() 메서드를 호출하면 강제적으로 먼저 값을 가지고 있는 상태에서 시작 할 수 있다.
  그리고 로드된 각 값을 넣어주기 위해서 if문을 이용해서 조건으로 
  키와 몸무게가 null값이 아니라면 시작할때 $height, $weight값을 가지고 시작하는 로직을 만들었다.
  
  


