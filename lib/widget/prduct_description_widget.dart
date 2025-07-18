import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [Text(description)]);
  }
}
