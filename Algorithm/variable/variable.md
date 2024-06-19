Variable 개념요약 
변수는 값을 일시적으로 저장한다.
변수를 사용하기 위해서는 type을 지정해야 한다. dart에는 다음과 같은 타입이 있다.

int, double, Stirng, bool, var, dynamic 

변수타입 + 변수명 = 값 순서대로 진행한다. 변수를 사용하기 위해서는 선언과 초기화라는 과정이 필요하다. 
String name = 'Minjae' 
값을 재할당할 떄는, 굳이 추가로 type을 안 써도 된다. 

```
Variable - null; 
int? num; 
int? num2 = 3;
num2 = null; 
```

Variable - null safety

```
int a; //null도 없고, 초기화 값도 없다.
int? b;  //null로 초기화 될 수 있다. 

void main() {
    print(a); //에러가 발생하고
    print(b); null이 나온다. 
    a=b! //null safety, nullable 변수를 non nullable 변수에 강제로 할당 
    b에 느낌표를 주면, b는 null이 아니다라는 의미로 되므로, 
    a=b!에 할당할 수 있게 된다. 
}

/ 값을 나눈다. -> 실수형(double)으로 반환
~/ 나눈 몫을 구한다 -> 정수형(int)으로 반환
% 나눈 나머지를 구한다 -> 정수형(int)으로 반환 
```