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

build내에는 로직 호출, 통신 http 같은 코드를 사용하면 안된다 = 매번 로딩을 하기때문에 안됨
* appbar에서 텍스트를 중심에 놓으려면 center 위젯이 아닌 centerTitle을 사용하면 된다
* TextField내 onSubmitted는 사용자가 입력하고 제출할때 호출, onChanged는 사용자가 입력이 변경될때마다 호출
* 
* 근데 이 아랫줄은 생각을 좀 해봐야됨
* final repository = PixabayImageItemRepository();는 변수 선언과 동시에 객체를 생성 및 초기화합니다.
  final PixabayRepository _pixabayRepository;는 변수 선언만 하고 초기화는 나중에 이루어집니다. 
* 또한 언더스코어(_)로 시작하여 프라이빗 변수임을 나타냅니다.
* changeNotifierProvider는 의존성 주입, 상태관리지만 상태관리에만 집중을 하면 좋을거 같고
* 의존성 주입은 GetIt으로 하는 것을 추천? 한다

Stream
* changeNotifierProvider를 안쓰면 Stream으로 상태관리 가능
* 데이터를 UI로 자동변환이 되는데, 필요없는 경우에는 Stream을 안써도 된다
* .listen으로 구독하면 해지를 꼭 해지!
* cold Stream - 구독을 하면 그때부터 데이터를 보냄(하나의 리스너로만 제약) 
* - 일반적으로 한 화면에 하나의 데이터를 사용하는 경우
* 
* hot Stream- 계속 데이터를 보내고 있다가 구독하면 보냄 지나간건 보내지 않음(여러 리스너를 허용 .broadcase 생성자 사용)
* viewModel에 여러 화면을 공유한다면 Hot Stream으로 연결해야할 거 같음

* 다이얼로그 가 떴다가 사라질때 1회성 이벤트
* sink - 데이터가 줄줄줄 흐른다(싱크대의 싱크)
* 구독은 initState 밖에 안됨(1회성)
- Future.microtask로 잠깐 시간을 벌어준다
* 만들일이 있을 때 - yield

DI
* 인젝터블 패키지를 이용해서 의존성 주입을 편하게 하는 패키지
* 어노테이션을 이용해서 @Singleton(as: NoteRepository) 이라고 쓰고 빌드하면 필요로 하는곳에 싱글턴으로 들어간다
* Future<void> 로 사용할 때가 있는데 시간이 오래걸리는 코드들에 필요할때가 있고, 기본은 void로 실행하면 된다
* interface면 대문자 @Singleton 하고<여기에 인터페이스 넣고>
* viewModel이면 팩토리기에 @injectable만 하면 된다
* viewModel에는 레파짓토리,데이터소스 만 생성자로 받자
* 모듈에서 전부다 lazysingleton  으로 하는게 속편함
* diSetup에서 getIt 모듈 3벌을 만들어서, 메서드만 교체해서 해도 된다(prod,dev,test)

고급 상태 관리 기술


* git
* 체리픽