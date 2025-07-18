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

class CartItem {
  final Product product;
  int number;

  CartItem({required this.product, required this.number});
}

class Cart {
  static final Cart instance = Cart._internal();

  Cart._internal();

  final List<CartItem> items = [];
}

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
  List<Product> searchProducts(String query) {
    if (query.isEmpty) return products;

    return products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
