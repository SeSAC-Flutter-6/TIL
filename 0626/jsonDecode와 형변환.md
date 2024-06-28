
```dart 
class PostApi {
   Future<dynamic> fetchDataById(int id) async {
       final response = await http.get(Uri.parse('$_baseURL/${id.toString()}'));
       if (response.statusCode == 200) {
         final dynamic postListJson =
             jsonDecode(utf8.decode(response.bodyBytes));
         return postListJson;
       }
   }

   Future<List<dynamic>> fetchAllData() async {
       final response = await http.get(Uri.parse(_baseURL));
       if (response.statusCode == 200) {
         final List<dynamic> postListJson =
             jsonDecode(utf8.decode(response.bodyBytes));
         return postListJson;
       } 
   }
}  
```
api 클래스에서 저런 방식으로 데이터를 처리했는데 이는 jsonDecode 때문이었다.   

### JsonDecode 
jsonDecode 함수는 JSON 형식의 문자열을 Dart의 데이터 구조로 변환해주는 역할을 합니다. 구체적으로는 다음과 같은 반환값을 가진다:

- Map<String, dynamic>: JSON 객체를 Dart의 Map으로 변환. JSON 객체는 중괄호 {}로 둘러싸인 key-value 쌍의 집합을 의미.
- List<dynamic>: JSON 배열을 Dart의 List로 변환. JSON 배열은 대괄호 []로 둘러싸인 값들의 순서 있는 목록을 의미.
- String, num, bool, null: JSON 문자열, 숫자, 불리언 값, null 값을 각각 Dart의 String, num (int 또는 double), bool, null 값으로 변환.  

그런데 이걸 변환하는 과정에서 fetchDataById 와 fetchAllData을 처리하는 과정이 좀 달랐다.   
fetchDataById의 경우는 굳이 명시적인 형변환이 필요없었는데 fetchAllData의 경우는 형변환이 꼭 필요했다.  

```dart 
class PostApi {
   Future<Map<String, dynamic>> fetchDataById(int id) async {
       final response = await http.get(Uri.parse('$_baseURL/${id.toString()}'));
       if (response.statusCode == 200) {
         final postListJson = jsonDecode(utf8.decode(response.bodyBytes));
        return postListJson;
       }
   }

   Future<List<Map<String, dynamic>>> fetchAllData() async {
       final response = await http.get(Uri.parse(_baseURL));
       if (response.statusCode == 200) {
         final List<dynamic> postListJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        return postListJson.cast<Map<String, dynamic>>();
       } 
   }
}  
```  

### fetchDataById 메서드  
  * fetchDataById 메서드는 특정 ID에 해당하는 데이터를 가져옴.
  * 반환된 데이터는 하나의 객체를 나타내므로, 일반적으로 JSON 데이터를 파싱한 후 그대로 반환
  * 예를 들어, jsonDecode(utf8.decode(response.bodyBytes))를 통해 JSON 문자열을 파싱하면, 반환된 값은 Map<String, dynamic> 타입.
  *  따라서 별도의 형변환 없이도 원하는 데이터 형식으로 사용할 수 있다.  
  
### fetchAllData 메서드
* fetchAllData 메서드는 여러 개의 데이터를 리스트 형태로 가져옴.
* jsonDecode(utf8.decode(response.bodyBytes))를 통해 반환된 데이터는 List<dynamic> 형식.
* 이 데이터를 사용하기 위해서는 명시적으로 타입을 지정해줘야함.

### 정리
- fetchDataById에서는 단일 객체를 가져오기 때문에 반환된 데이터를 바로 사용할 수 있다.
- fetchAllData에서는 여러 개의 객체를 가져오기 때문에 명시적인 타입 변환을 해주어야 각 객체를 적절히 사용할 수 있다. 

