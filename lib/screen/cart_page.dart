import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //가격 포맷팅(세자리마다쉼표)
//import 'package:flutter_spinbox/flutter_spinbox.dart'; //수량조절
import '../product_model.dart';
import '../widget/cart_item_tile.dart';
import '../screen/product_list_page.dart';

// 장바구니 페이지 이고 상품 목록 페이지에서 상품을 클릭하면 장바구니 페이지로 이동
class CartPage extends StatefulWidget {
  final Product? product;
  final int? number;
  // 상품 상세 목록 페이지에서 이동시는 상품 모델과 수량을 받아옴
  // 그외 경우인 상품 목록 페이지에서는 받아오지 않음 그래서  nullable 타입으로 선언
  const CartPage({super.key, this.product, this.number});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Cart cart = Cart.instance;

  @override
  void initState() {
    super.initState();
    // 유효한 상품(product)과 수량(number)이 전달된 경우:
    // 이미 장바구니에 해당 상품이 있으면 수량만 증가시키고,
    // 없으면 새 항목으로 추가함
    if (widget.product != null && widget.number != null) {
      final index = cart.items.indexWhere(
        (item) => item.product.name == widget.product!.name,
      );
      if (index != -1) {
        setState(() {
          cart.items[index].number += widget.number!;
        });
      } else {
        setState(() {
          cart.items.add(
            CartItem(product: widget.product!, number: widget.number!),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    // 장바구니에 있는 상품의 총 가격을 계산
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
            // 장바구니에 상품이 없으면 장바구니가 비었습니다. 라는 텍스트를 표시
            // 장바구니에 상품이 있으면 상품 목록을 표시
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
