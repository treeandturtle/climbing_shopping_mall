import 'package:flutter/material.dart';

// 상품 설명 위젯 이고 상품 설명을 표시
class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [Text(description)]);
  }
}
