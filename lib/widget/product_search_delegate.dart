import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../product_model.dart';

class ProductSearchDelegate extends SearchDelegate {
  final List<Product> products;

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
