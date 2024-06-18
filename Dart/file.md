### 파일

- 파일 조작의 기본 순서
  1. open
  2. read or write
  3. close
  - dart에서는 편리하게 읽거나 쓰면 자동으로 닫아준다.

```
final myFile = File('save.txt');

myFile.writeAsStringSync('hello');
```
