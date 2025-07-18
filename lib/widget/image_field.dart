import 'package:flutter/material.dart';
import 'dart:io';

class ImageField extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onPick;
  const ImageField({super.key, this.imageUrl, required this.onPick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPick,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: imageUrl!.startsWith('http')
                    ? Image.network(imageUrl!, fit: BoxFit.cover)
                    : Image.file(File(imageUrl!), fit: BoxFit.cover),
              )
            : const Icon(Icons.add_a_photo, size: 48, color: Colors.grey),
      ),
    );
  }
}
