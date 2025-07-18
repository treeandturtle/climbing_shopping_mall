import 'package:climbing_shopping_mall/widget/number_button.dart';
import 'package:climbing_shopping_mall/widget/prduct_description_widget.dart';
import 'package:flutter/material.dart';
import '../product_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

int totalPrice = 0;
int number = 0;

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grab it')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: widget.product.imageUrl.startsWith('http')
                  ? Image.network(widget.product.imageUrl, fit: BoxFit.fill)
                  : Image.asset(widget.product.imageUrl, fit: BoxFit.fill),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.product.price.toString()}원',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ProductDescriptionWidget(
                description: widget.product.description,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButton(
                  onChanged: (number) {
                    setState(() {
                      number = number;
                      totalPrice = widget.product.price * number;
                    });
                  },
                ),
                const SizedBox(width: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // TODO: 장바구니 담기 기능 구현
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('장바구니에 담았습니다.')),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProductAddPage(),
                    //   ),
                    // );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        '총 가격  ${totalPrice.toString()}원',
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text('장바구니 담기', style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
