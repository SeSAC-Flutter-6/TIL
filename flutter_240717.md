navigator.of(context).push 
- context가 없으면 이동이 안된다(datasource, repository같은 데는 이동이 안돼
  근데, getX를 하면 이동이 된다)

데이터돌려받기 - todolist 같은것으로 예시를 보면
               리스트 페이지 다음화면에서 새로 할일을 쓰고 추가해서
               앞 화면으로 돌아갔을때 새로 할일이 추가되있어야 하는 경우

context.push(Uri(paht : '/', queryParameters: {'age': 10}))
 - 10에 해당하는 위치에 dynamic이 아니라 String으로 보내야한다
 - 받는 쪽에서 String으로 되어있다
 - 객체하나 보낼때는 extra로 보내는게 더 편함

WEBP 가 PNG보다 훨씬 용량이 작다

기기들이 크기가 다양하니 컴포넌트를 높이 정도만 주고, 
가로는 double.infinity정도를 주는게 유지보수가 용이하다

안드로이드 스튜디오 뉴 터미널에서는 build runner build가 호환이 안된다

viewmodel의 액션은 모두다 void 그래서 fetct가 어울림
getter로만 나간다
나머지는 다 void로 한쪽으로만 간다
상태도 뷰모델에 넣는다

리액티브 프로그래밍 - 상태가변경되면 자동으로 반영
                    리스너블빌더(listenableBuilder)


