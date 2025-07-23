import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 상품 등록 페이지에서 사용하는 텍스트 필드 위젯 이고 상품명, 가격, 설명 필드를 표시
// 모두 기본적인 구현이여서 따로 설명은 하지 않겠습니다
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: '가격',
        hintText: '숫자만 입력해 주세요',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
        labelText: '상품 세부 설명',

        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (v) => (v == null || v.trim().isEmpty) ? '설명을 입력해 주세요.' : null,
    );
  }
}
