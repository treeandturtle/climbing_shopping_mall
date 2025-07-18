import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../product_model.dart';
import '../widget/image_field.dart';
import '../widget/register_field.dart';
import '../screen/product_list_page.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});
  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final _formKey = GlobalKey<FormState>();
  String? _imageUrl;
  // 텍스트 필드 컨트롤러
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  //이미지 선택 추후에 수정 필요
  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageUrl = image.path; // 로컬 파일 경로 저장
      });
    }
  }

  // 제출시 예외에 해당하지 않으면 productList에 추가 후 메시지 출력
  void _submit() {
    if (_imageUrl == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('이미지를 선택해 주세요.')));
      return;
    }
    if (_formKey.currentState?.validate() ?? false) {
      // 인스턴스 생성후 리스트에 추가
      ProductList.instance.products.add(
        Product(
          name: _nameController.text,
          imageUrl: _imageUrl!,
          price: int.parse(_priceController.text),
          description: _descController.text,
        ),
      );

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('등록 완료'),
          content: const Text('상품이 성공적으로 등록되었습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ProductListPage()),
                (route) => false,
              ),
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Grab it',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ImageField(imageUrl: _imageUrl, onPick: _pickImage),
              const SizedBox(height: 24),
              NameField(controller: _nameController),
              const SizedBox(height: 16),
              PriceField(controller: _priceController),
              const SizedBox(height: 16),
              DescriptionField(controller: _descController),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _submit,
                  child: const Text(
                    '등록하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
