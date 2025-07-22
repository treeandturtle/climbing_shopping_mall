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
      description: "",
    ),
    Product(
      name: "DYNAMIC T-SHIRT",
      price: 55000,
      imageUrl: "assets/2.jpg",
      description: "",
    ),
    Product(
      name: "HOLD BRUSH SET",
      price: 30000,
      imageUrl: "assets/3.jpg",
      description: "",
    ),
    Product(
      name: "CROP SLEEVELESS",
      price: 33000,
      imageUrl: "assets/4.jpg",
      description: "",
    ),
    Product(
      name: "TURTLE LOGO T-SHIRT",
      price: 35000,
      imageUrl: "assets/5.jpg",
      description: "",
    ),
    Product(
      name: "WHILE LOGO CARABINER ",
      price: 6900,
      imageUrl: "assets/6.jpg",
      description: "",
    ),
    Product(
      name: "POTATO T-SHIRT",
      price: 35000,
      imageUrl: "assets/7.jpg",
      description: "",
    ),
    Product(
      name: "DYNAMIC BLACK TAPE",
      price: 9400,
      imageUrl: "assets/8.jpg",
      description: "",
    ),
    Product(
      name: "HOLD CANDLE",
      price: 15000,
      imageUrl: "assets/9.jpg",
      description: "",
    ),
    Product(
      name: "SANDING BLOCK",
      price: 4000,
      imageUrl: "assets/10.jpg",
      description: "",
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
