import 'package:flutter/material.dart';
import 'dart:io';

// 이미지 필드 이고 이미지 파일 경로를 받아와서 이미지 표시
class ImageField extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onPick;
  const ImageField({super.key, this.imageUrl, required this.onPick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPick,
      child: Container(
        width: 264,
        height: 330,
        decoration: BoxDecoration(
          color: Colors.grey[100],

          // border: Border.all(color: Colors.blueGrey, width: 2),
        ),
        // 이미지 파일 경로 확인 후 이미지 표시
        // 이미지 파일 경로가 http로 시작하면 웹 이미지 표시
        // 이미지 파일 경로가 /로 시작하면 로컬 이미지 표시
        child: imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: imageUrl!.startsWith('http')
                    ? Image.network(imageUrl!, fit: BoxFit.fill)
                    : Image.file(File(imageUrl!), fit: BoxFit.fill),
              )
            : const Icon(Icons.add_a_photo, size: 48, color: Colors.grey),
      ),
    );
  }
}
