// 상품 모델이고 이름, 이미지, 가격, 설명 이렇게 4개의 필드를 가지고 있음
class Product {
  final String name;
  final String imageUrl;
  final int price;
  final String description;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}

// 장바구니 물품 모델이고  상품, 수량 이렇게 2개의 필드를 가지고 있음
class CartItem {
  final Product product;
  int number;

  CartItem({required this.product, required this.number});
}

// 장바구니 모델이고 아이템 리스트를 가지고 있음 그리고 싱글턴 패턴으로 구현
class Cart {
  static final Cart instance = Cart._internal();

  Cart._internal();

  final List<CartItem> items = [];
}

// 상품 목록 모델이고 상품 리스트를 가지고 있음 그리고 싱글턴 패턴으로 구현
class ProductList {
  static final ProductList instance = ProductList._internal();

  ProductList._internal();

  final List<Product> products = [
    Product(
      name: "FINGER TAPE",
      price: 11000,
      imageUrl: "assets/1.jpg",
      description: '''
클라이머들의 필수품! 손가락 관절 보호와 부상 방지를 위한 전용 테이프입니다.

- 미끄러짐 없이 강한 접착력
- 민감한 피부에도 적합한 부드러운 재질
- 클라이밍 중 안정적인 그립 제공
''',
    ),
    Product(
      name: "DYNAMIC T-SHIRT",
      price: 55000,
      imageUrl: "assets/2.jpg",
      description: '''
흡습속건 기능의 스트레치 티셔츠로 실내외 클라이밍에 최적화된 디자인입니다.

- 등판 메쉬 구조로 통기성 우수
- 슬림핏으로 활동성 향상
- 클라이밍은 물론 일상복으로도 활용 가능
''',
    ),
    Product(
      name: "HOLD BRUSH SET",
      price: 30000,
      imageUrl: "assets/3.jpg",
      description: '''
초크 잔여물 및 먼지를 깔끔히 제거해주는 홀드 전용 브러시 세트입니다.

- 다양한 크기의 브러시 포함
- 내구성 강한 합성모 사용
- 작은 홀드부터 큰 홀드까지 완벽 커버
''',
    ),
    Product(
      name: "CROP SLEEVELESS",
      price: 33000,
      imageUrl: "assets/4.jpg",
      description: '''
여름철 실내 클라이밍에 제격인 크롭 슬리브리스 탑입니다.

- 쿨링 기능성 원단 사용
- 신축성 뛰어나 격한 동작에도 편안함
- 스포츠 브라와 레이어드하기 좋은 디자인
''',
    ),
    Product(
      name: "TURTLE LOGO T-SHIRT",
      price: 35000,
      imageUrl: "assets/5.jpg",
      description: '''
등판의 거북이 로고가 포인트인 감성 티셔츠입니다.

- 클라이밍 후 일상복으로도 OK
- 유니섹스 사이즈 구성
- 커플룩, 팀룩으로도 인기
''',
    ),
    Product(
      name: "WHILE LOGO CARABINER",
      price: 6900,
      imageUrl: "assets/6.jpg",
      description: '''
로고가 인쇄된 다용도 경량 카라비너입니다. 

- 열쇠고리, 초크백 고정용
- 컴팩트한 크기로 휴대 간편
- ※ 등반용 안전 장비 아님
''',
    ),
    Product(
      name: "POTATO T-SHIRT",
      price: 35000,
      imageUrl: "assets/7.jpg",
      description: '''
감자 그래픽이 돋보이는 유쾌한 디자인의 티셔츠입니다.

- 순면 소재로 착용감 우수
- 루즈핏으로 활동성 높음
- 클라이밍/캐주얼룩 겸용
''',
    ),
    Product(
      name: "DYNAMIC BLACK TAPE",
      price: 9400,
      imageUrl: "assets/8.jpg",
      description: '''
고강도 운동에 적합한 블랙 스포츠 테이프입니다.

- 관절 고정력 탁월
- 팔꿈치, 손목, 손가락 등 다용도 사용
- 피부 자극 적은 재질
''',
    ),
    Product(
      name: "HOLD CANDLE",
      price: 15000,
      imageUrl: "assets/9.jpg",
      description: '''
클라이밍 홀드를 형상화한 감성 인테리어 캔들입니다.

- 피톤치드 향으로 안정감 제공
- 인테리어 소품으로 인기
- 클라이머 친구에게 선물용 추천
''',
    ),
    Product(
      name: "SANDING BLOCK",
      price: 4000,
      imageUrl: "assets/10.jpg",
      description: '''
굳은살 제거에 최적화된 휴대용 샌딩 블록입니다.

- 미세 연마면으로 피부 손상 최소화
- 손바닥, 손가락용 이중 구조
- 운동 후 손 관리에 필수
''',
    ),
  ];

  // 검색 기능 메서드
  // 검색어가 비어있으면 모든 상품을 반환하고 검색어가 있으면 검색어를 포함하는 상품을 반환
  // 검색어 확인은 받아온 query를 소문자로 변환하고 상품 이름과 설명을 소문자로 변환하여 포함 여부를 확인
  // 포함 여부는 where 메서드를 사용하여 확인
  List<Product> searchProducts(String query) {
    if (query.isEmpty) return products;

    return products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
