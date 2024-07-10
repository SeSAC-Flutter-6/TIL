 stateless widget에서 
gesturedetector, inkwell 같은 걸로 활용하지 말자
 - 재사용성이 떨어지고, 화면 이동은 되고, 

=> .call 메서드를 통해서 이벤트를 돌려주자

rule!!
1. 데이터가 바꿨어? 생성자를 통해서 데이터를 입력
2. 이벤트가 발생했어? .call 메서드를 통해서 이벤트를 돌려줘

stateless에서 상태를 가지게 되면, 

test 코드 
1. MaterialApp - Scaffold - body - widget 까지는 필요하다
2. widget을 테스트할때는 widget을 테스트하는게 아니라, widget을 통해서 이벤트를 돌려주는 것을 테스트해야 한다