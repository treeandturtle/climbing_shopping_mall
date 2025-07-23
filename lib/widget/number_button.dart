import 'package:flutter/material.dart';

//product 상품 갯수 증가 감소 위젯 이고 수량 증가 감소 버튼을 표시

class NumberButton extends StatefulWidget {
  const NumberButton({super.key, required this.onChanged});
  final Function(int) onChanged;

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueGrey, width: 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (number > 0) {
                  // 수량이 0보다 크면 수량 감소
                  // 수량 감소 후 콜백 함수 호출로 화면에 수량 업데이트
                  number--;
                  widget.onChanged(number);
                }
              });
            },
            icon: Icon(Icons.remove, size: 15),
          ),

          Text(number.toString()),

          IconButton(
            onPressed: () {
              setState(() {
                if (number < 100) {
                  // 수량이 100보다 작으면 수량 증가
                  // 수량 증가 후 콜백 함수 호출로 화면에 수량 업데이트
                  number++;
                  widget.onChanged(number);
                }
              });
            },
            icon: Icon(Icons.add, size: 15),
          ),
        ],
      ),
    );
  }
}
