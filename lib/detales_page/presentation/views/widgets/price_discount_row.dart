import 'package:flutter/material.dart';

class PriceDiscountRow extends StatelessWidget {
  final String? discount; // نص الخصم
  final String oldPrice; // السعر القديم
  final String newPrice; // السعر الجديد
  final Color discountColor; // لون خلفية الخصم
  final Color priceColor; // لون السعر القديم

  const PriceDiscountRow({
    Key? key,
    this.discount,
    required this.oldPrice,
    required this.newPrice,
    this.discountColor = Colors.red,
    this.priceColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 70,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          decoration: BoxDecoration(
            color: discountColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              discount ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              oldPrice,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: priceColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              newPrice,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
