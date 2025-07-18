import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../product_model.dart';
import '../screen/product_detail_page.dart';
import '../screen/product_add_page.dart';
import 'package:iconsax/iconsax.dart';
import '../screen/cart_page.dart';
import '../widget/product_search_delegate.dart';

class ProductListPage extends StatelessWidget {
  final ProductList productList = ProductList.instance;

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Grab it',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Iconsax.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView.builder(
              itemCount: productList.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 60,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                final product = productList.products[index];
                return LayoutBuilder(
                  builder: (context, constraints) {
                    final double imageSize = constraints.maxWidth;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 상품 이미지 (정사각형)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(product: product),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: constraints.maxWidth * 4 / 3,
                            child: product.imageUrl.startsWith('http')
                                ? Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // 상품 이름
                        Text(
                          product.name,
                          style: const TextStyle(fontSize: 15),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        const SizedBox(height: 4),
                        // 상품 가격 (int → 문자열 변환)
                        Text(
                          '${NumberFormat('#,###').format(product.price)}원',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            right: 15,
            bottom: 55,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'search',
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(productList.products),
                    );
                  },
                  shape: const CircleBorder(),
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.search, size: 28),
                ),
                const SizedBox(height: 15),
                FloatingActionButton(
                  heroTag: 'add',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductAddPage(),
                      ),
                    );
                  },
                  shape: const CircleBorder(),
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.add, size: 28),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
