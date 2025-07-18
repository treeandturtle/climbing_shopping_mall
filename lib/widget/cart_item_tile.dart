import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../product_model.dart';

class CartItemTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final VoidCallback? onDelete;

  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
    this.onAdd,
    this.onRemove,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(product.imageUrl),
                    width: 120,
                    height: 160,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${NumberFormat('#,###').format(product.price)}원'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: onRemove,
                            ),
                            Text(' $quantity'),
                            IconButton(icon: Icon(Icons.add), onPressed: onAdd),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: onDelete,
                tooltip: '삭제',
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
