
context.read - 1회성
context.watch - 반복하는UI 재사용이 가능
## onPressed 내에서 .watch로 접근하면 에러. read로 사용해야한다
## consumer로 감싸면 하단에 context.read로 사용해야함

그래서 위에 viewModel = xxx 하고 
하단에서 viewModel.xx 로 메서드 호출



initState - build - microtask
빌드가 한번이라도 호출이 되야 context로 접근이 되면 가져올수 있다
 - Future.microtask() 이용

-> viewModel에 생성자에 특정 메서드를 실행하려면 넣어놓으면 된다
(시작하자마자 바로 실행)

firebase
