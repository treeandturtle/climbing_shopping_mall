import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;
  const NameField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '상품명',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      validator: (v) =>
          (v == null || v.trim().isEmpty) ? '상품명을 입력해 주세요.' : null,
    );
  }
}

class PriceField extends StatelessWidget {
  final TextEditingController controller;
  const PriceField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: '가격',
        hintText: '숫자만 입력해 주세요',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      validator: (v) {
        if (v == null || v.trim().isEmpty) return '가격을 입력해 주세요.';
        if (int.tryParse(v) == null) return '숫자만 입력해 주세요.';
        return null;
      },
    );
  }
}

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;
  const DescriptionField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: '상품 설명',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      validator: (v) => (v == null || v.trim().isEmpty) ? '설명을 입력해 주세요.' : null,
    );
  }
}
