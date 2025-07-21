import 'package:climbing_shopping_mall/widget/number_button.dart';
import 'package:climbing_shopping_mall/widget/prduct_description_widget.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../product_model.dart';
import 'package:intl/intl.dart';
import 'cart_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int number = 0;
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grab it',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 330,
                height: 412,
                child: widget.product.imageUrl.startsWith('http')
                    ? Image.network(widget.product.imageUrl, fit: BoxFit.cover)
                    : widget.product.imageUrl.startsWith('/')
                    ? Image.file(
                        File(widget.product.imageUrl),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(widget.product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${NumberFormat('#,###').format(widget.product.price)}원',
              style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
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
                  onChanged: (n) {
                    setState(() {
                      number = n;
                      totalPrice = widget.product.price * number;
                    });
                  },
                ),
                const SizedBox(width: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (number > 0) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            '${widget.product.name}을 ${number.toString()}개 구매하시겠습니까?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                '취소',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('장바구니에 담았습니다.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartPage(
                                      product: widget.product,
                                      number: number,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('구매 수량을 입력해주세요.')),
                      );
                    }
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
