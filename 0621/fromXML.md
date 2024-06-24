## xml 파싱 과제

기본적으로.. xml 패키지가 존재함. 그냥 그거 쓰는게 좋을지도.. 그렇지만 굳이굳이 외부 패키지 없이 해보기로 마음먹었다

### 먼저 가져올 데이터의 구조를 파악
```
    <row>
    <rowNum>1</rowNum>
    <selectedCount>5</selectedCount>
    <totalCount>22</totalCount>
    <subwayId>1065</subwayId>
    <updnLine>상행</updnLine>
    <trainLineNm>인천공항2터미널행 - 공덕방면</trainLineNm>
    <statnFid>1065006502</statnFid>
    <statnTid>1065006501</statnTid>
    <statnId>1065006501</statnId>
    <statnNm>서울</statnNm>
    <trnsitCo>4</trnsitCo>
    <ordkey>01000인천공항2터미널0</ordkey>
    <subwayList>1001,1004,1063,1065</subwayList>
    <statnList>1001000133,1004000426,1063080313,1065006501</statnList>
    <btrainSttus>일반</btrainSttus>
    <barvlDt>0</barvlDt>
    <btrainNo>A2049</btrainNo>
    <bstatnId>110</bstatnId>
    <bstatnNm>인천공항2터미널</bstatnNm>
    <recptnDt>2024-06-24 10:23:33</recptnDt>
    <arvlMsg2>서울 출발</arvlMsg2>
    <arvlMsg3>서울</arvlMsg3>
    <arvlCd>2</arvlCd>
    </row>  
```  

    
이런 데이터들이 여러개 넘어오고있는 형태
태그이름으로 접근해서 그 사이의 내용물을 가져와야함. 
    
먼저 저 데이터들을 싹 다 string으로 받은 다음에 tag이름을 index값을 찾고 인덱스 값 사이의 문자열을 잘라와서 리턴하는 방법을 가장 먼저 떠올렸다.   
단순무식하지만 문제의 데이터값들을 처리하기엔 충분할것 같았음
    
```dart
    
        final startTagIndex = xml.indexOf(startTag);
        final endTagIndex = xml.indexOf(endTag);
        
        xml.substring(startTagIndex + startTagLength, endTagIndex).trim();
```  
뭐 이런식으로..?  그런데 항상 썩 마음에 드는 방법이 아닌것이 문제다.. 
    
`indexOf`, `substring`, `trim` 등의 문자열 처리 함수는 주어진 문자열에서 단순히 위치를 찾거나 일부를 잘라내는 작업을 수행하는 애들인데 XML의 구조가 예상과 다르다든지 잘못 잘라냈다든지.. 에러사항이 많을것 같았음.   
내가 하고싶었던건 뭔가 태그를 인식해서 마치 getElementsByName() 이런거 사용해서 값가져오는 형태를 하고싶었다
    
<tag></tag> 태그 형태를 기반으로 찾아내는게 가장 정확도 높게 파싱할 것 같은데.. 라는 생각을 하다가 정규식패턴으로 추출해보면 되지 않을까 생각함.   

정규식 패턴사용은 옛날에 한 번 유효성검사할때 써본 기억이 있어서 어찌저찌 생각난것같음 
>tagName을 파라미터로 받아서 <tagName></tagName> 형태의 정규식 패턴을 만들고 거기에 매치하는 애를 파싱하는게 목표. 
    
정규식 패턴 찾아보는과정에서 흥미로운것들을 알게됨
일단 최종적으로 패턴은 다음과 같다. 
    
 ```dart
    final pattern = RegExp('<$tagName>(.*?)</$tagName>', dotAll: true);
```
    
- **`*`**: 앞의 문자가 0회 이상 반복될 수 있음. 기본적으로 "탐욕적"(greedy)으로 동작하여 가능한 한 많이 일치하려고 함.
 - **`?`**:  ****"탐욕적이지 않은"(non-greedy) 매칭으로 바꿔줌 → 가능한 적게 일치하려고 한다

이게 무슨말이냐면,,

```dart
void main() {
  final text = '<tag>first</tag> and <tag>second</tag>';

  // 탐욕적 매칭 (Greedy)
  final greedyPattern = RegExp('<tag>.*</tag>');
  final greedyMatch = greedyPattern.firstMatch(text);
  if (greedyMatch != null) {
    print('탐욕적 매칭 결과: ${greedyMatch.group(0)}');
    // 출력: <tag>first</tag> and <tag>second</tag> 
    // <tag> 와 </tag> 사이에 최대한 많이 담으려고함. -> 파싱 의도와 달라짐
  }

  // 비탐욕적 매칭 (Non-greedy)
  final nonGreedyPattern = RegExp('<tag>.*?</tag>');
  final nonGreedyMatch = nonGreedyPattern.firstMatch(text);
  if (nonGreedyMatch != null) {
    print('비탐욕적 매칭 결과: ${nonGreedyMatch.group(0)}');
    // 출력: <tag>first</tag>
    // <tag> 와 </tag> 사이에 최대한 적게 담으려고 함 -> 파싱 의도와 일치
  }
}

```
그리디를 알고리즘이 아닌 곳에서도 만나다니 좀 신기했음

또 하나 알게된것은 정규식에서의 괄호의 역할이였다.

- **캡처 그룹 (Capture Group)**
    - 괄호는 정규 표현식의 일부를 캡처 그룹으로 만든다.
    - 캡처 그룹은 정규 표현식이 매칭되는 동안 일치한 텍스트를 나중에 사용할 수 있도록 저장함.
- **추출된 데이터 접근**
    - 매칭된 텍스트는 `Match` 객체의 `group` 메서드를 통해 접근할 수 있음.
    - `match.group(0)`은 정규 표현식과 일치하는 전체 문자열을 의미
    - `match.group(1)`은 첫 번째 캡처 그룹에 해당하는 내용을 반환하는데 괄호를 사용하면 괄호안의 내용이 캡쳐가 됨.
    - 만약 괄호가 없으면, 정규 표현식은 특정 부분을 캡처하지 않기때문에 group(1)과 같은 접근을 할 수 없음

```dart
void main() {
  final text = '<tag>Hello, World!</tag>';
  final pattern = RegExp('<tag>(.*?)</tag>');
  final match = pattern.firstMatch(text);

  if (match != null) {
    print('group(0): ${match.group(0)}'); // 전체 매칭된 문자열. <tag>Hello, World!</tag>
    print('group(1): ${match.group(1)}'); // 첫 번째 캡처 그룹에 매칭된 문자열. Hello, World!
  }
}

```

아무튼 이런 정보들을 줍줍해서 내가 원하던대로 파싱하고 싶은 태그의 이름을 넣으면 안에있는 요소를 추출할 수 있게됐다!  

그런데 예상치못한 에러사항이 또 있었다. json의 경우 map형태로 파싱을하니까 같은 형태의 데이터를 리스트로 쉽게 처리할수있었는데

```
final List<dynamic> todoListJson = jsonDecode(response.body);
final List<Todo> todoList = todoListJson
            .map<Todo>((json) => Todo.fromJson(json))
            .toList();
```

xml에서는 일단 모두 String으로 받아오기때문에
```
<realtimeStationArrival>
<RESULT>
<code>INFO-000</code>
<developerMessage/>
<link/>
<message>정상 처리되었습니다.</message>
<status>200</status>
<total>22</total>
</RESULT>
<row>...</row>
<row>...</row>
<row>...</row>
<row>...</row>
<row>...</row>
</realtimeStationArrival>
```

\<row>\</row> 안의 데이터들을 일괄적으로 처리할 수 없었다..  여기서 걍 패키지 쓰고 싶었음.. 대체 난 왜 이걸 직접 파싱하고 있는가ㅠ

그냥 어렵게 생각하지 말고 반복되는 데이터 태그를 처리하기 위한 별도의 함수를 만들었다.   
그냥 \<row>\</row> 얘네들만 뽑아서 List\<String>으로 넣어두면 되지! 

그런김에 걍 xmlUtil클래스를 만들어서 xml 파싱과 관련된 함수를 모아두었다. 범용적으로 쓰기 좋게 태그이름을 파라미터로 받음

```dart
class XmlUtils {
  // 특정 태그의 값을 추출하는 함수
  static String getElementValue(String xml, String tagName) {
    final pattern = RegExp('<$tagName>(.*?)</$tagName>');
    final match = pattern.firstMatch(xml);
    return match?.group(1)?.trim() ?? '';
  }

  // 반복되는 태그로 감싸진 데이터를 추출하여 리스트로 반환
  static List<String> extractTagValues(String xml, String tagName) {
    final List<String> values = [];
    final pattern = RegExp('<$tagName>.*?</$tagName>');
    final matches = pattern.allMatches(xml);

    for (var match in matches) {
      if (match.group(0) != null) {
        values.add(match.group(0)?.trim() ?? '');
      }
    }
    return values;
  }
}
```  

뭐 아무튼 클래스 모델에서 fromXML의 형태는 대충 이런식이됨 
```dart
factory RealtimeStationArrival.fromXML(String xml) {
    return RealtimeStationArrival(
      rowNum: int.parse(XmlUtils.getElementValue(xml, 'rowNum')),
      totalCount: int.parse(XmlUtils.getElementValue(xml, 'totalCount')),
      subwayId: XmlUtils.getElementValue(xml, 'subwayId'),
      updnLine: XmlUtils.getElementValue(xml, 'updnLine'),
      trainLineNm: XmlUtils.getElementValue(xml, 'trainLineNm'),
      statnNm: XmlUtils.getElementValue(xml, 'statnNm'),
      btrainSttus: XmlUtils.getElementValue(xml, 'btrainSttus'),
      btrainNo: XmlUtils.getElementValue(xml, 'btrainNo'),
      recptnDt: DateTime.parse(XmlUtils.getElementValue(xml, 'recptnDt')),
      arvlMsg2: XmlUtils.getElementValue(xml, 'arvlMsg2'),
    );
  }
```

데이터 받아오는건 다음과 같음  
```dart
//앞 부분 생략
final response =
          await http.get(Uri.parse('$_baseURL$startIndex/$endIndex/$statnNm'));
      if (response.statusCode == 200) {
        final String xmlString = utf8.decode(response.bodyBytes);
        final List<String> xmlDataList =
            XmlUtils.extractTagValues(xmlString, 'row');
        final List<RealtimeStationArrival> dataList = xmlDataList
            .map<RealtimeStationArrival>(
                (data) => RealtimeStationArrival.fromXML(data))
            .toList();  
//뒷부분 생략
``` 

하나 조심해야할거는 json 예제 api는   
```dart
final Map<String, dynamic> todoJson = jsonDecode(response.body);  
````
이렇게 유니코드문자열로 디코딩하지 않아도 잘 출력됐는데 xml예제 api는 어림도 없었음 utf8.decode() 함수로 디코딩해줘야함.   
```dart
final String xmlString = response.body;  //어림도 없지. 출력 다깨짐
final String xmlString = utf8.decode(response.bodyBytes);  //ok  
````

사실 후자쪽이 더 익숙한 접근이라 금방 해결함.   
```dart
// 문제 4
  List<RealtimeStationArrival> dataList =
      await subwayService.getRealtimeStationArrival(
          startIndex: 0.toString(), endIndex: 5.toString(), statnNm: '서울');
  for (RealtimeStationArrival data in dataList) {
    print(data);
  } 

//출력
RealtimeStationArrival(rowNum: 1, totalCount: 21, subwayId: 1065, updnLine: 상행, trainLineNm: 검암행 - 공덕방면, statnNm: 서울, btrainSttus: 일반, btrainNo: A3095, recptnDt: 2024-06-24 19:56:07.000, arvlMsg2: 서울 출발)
RealtimeStationArrival(rowNum: 2, totalCount: 21, subwayId: 1001, updnLine: 상행, trainLineNm: 의정부행 - 시청방면, statnNm: 서울, btrainSttus: 일반, btrainNo: 0178, recptnDt: 2024-06-24 20:01:27.000, arvlMsg2: 서울 도착)
RealtimeStationArrival(rowNum: 3, totalCount: 21, subwayId: 1001, updnLine: 상행, trainLineNm: 광운대행 - 시청방면, statnNm: 서울, btrainSttus: 일반, btrainNo: 0486, recptnDt: 2024-06-24 20:02:41.000, arvlMsg2: 전역 도착)
RealtimeStationArrival(rowNum: 4, totalCount: 21, subwayId: 1004, updnLine: 상행, trainLineNm: 당고개행 - 회현방면, statnNm: 서울, btrainSttus: 일반, btrainNo: 4186, recptnDt: 2024-06-24 20:02:27.000, arvlMsg2: 3분 28초 후 (삼각지))
RealtimeStationArrival(rowNum: 5, totalCount: 21, subwayId: 1063, updnLine: 상행, trainLineNm: 문산행 - 신촌(경의중앙선)방면, statnNm: 서울, btrainSttus: 일반, btrainNo: 5126, recptnDt: 2024-06-24 20:01:52.000, arvlMsg2: [2]번째 전역 (서강대))  
``` 
원하는대로 파싱완료
