import 'package:flutter/material.dart';

//product 상품 갯수 증가 감소 위젯
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
