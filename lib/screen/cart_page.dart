import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //가격 포맷팅(세자리마다쉼표)
//import 'package:flutter_spinbox/flutter_spinbox.dart'; //수량조절
import '../product_model.dart';
import '../widget/cart_item_tile.dart';
import '../screen/product_list_page.dart';

class CartPage extends StatefulWidget {
  final Product? product;
  final int? number;

  const CartPage({super.key, this.product, this.number});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Cart cart = Cart.instance;

  @override
  void initState() {
    super.initState();
    if (widget.product != null && widget.number != null) {
      cart.items.add(
        CartItem(product: widget.product!, number: widget.number!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    for (int i = 0; i < cart.items.length; i++) {
      totalPrice += cart.items[i].product.price * cart.items[i].number;
    }
    final formattedTotalPrice = NumberFormat('#,###').format(totalPrice);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Grab it',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.items.isEmpty
                ? const Center(child: Text('장바구니가 비었습니다.'))
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return CartItemTile(
                        product: cart.items[index].product,
                        quantity: cart.items[index].number,
                        onAdd: () {
                          setState(() {
                            cart.items[index].number++;
                          });
                        },
                        onRemove: cart.items[index].number > 1
                            ? () {
                                setState(() {
                                  cart.items[index].number--;
                                });
                              }
                            : null,
                        onDelete: () {
                          setState(() {
                            cart.items.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '총 금액: $formattedTotalPrice원',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 50),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cart.items.isEmpty
                      ? Colors.grey
                      : Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (cart.items.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('장바구니가 비었습니다.')),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListPage(),
                      ),
                    );
                  }
                },
                child: const Text(
                  '구매하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
