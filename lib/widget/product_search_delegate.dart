import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../product_model.dart';

// 상품 검색 위젯 이고 상품 목록 페이지에서 상품 검색 버튼을 클릭하면 상품 검색 위젯으로 이동
class ProductSearchDelegate extends SearchDelegate {
  final List<Product> products;
  // 추상 클래스 SearchDelegate 를 상속받아 구현
  //searchdelegate 는 검색 위젯을 구현하는 추상 클래스
  //그것을 재정의 하여 상품 검색 위젯을 구현
  ProductSearchDelegate(this.products);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return Center(child: Text('검색 결과가 없습니다.'));
    }

    return ListView(
      children: results
          .map(
            (p) => ListTile(
              title: Text(p.name),
              subtitle: Text('${NumberFormat('#,###').format(p.price)}원'),
              leading: Image.asset(p.imageUrl, width: 40, height: 40),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
