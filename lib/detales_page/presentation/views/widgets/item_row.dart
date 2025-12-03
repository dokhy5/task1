import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ItemRow extends StatelessWidget {
  final String sku;
  final double rating;
  final int reviewsCount;

  const ItemRow({
    Key? key,
    required this.sku,
    required this.rating,
    required this.reviewsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // النجوم
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: StarRating(
            rating: rating,
            starCount: 5,
            size: 20,
            color: Colors.amber,
            borderColor: Colors.amber,
          ),
        ),

        const SizedBox(width: 6),

        // الرقم + كلمة "تقييمات" تحت بعض
        Text(
          '$reviewsCount',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
        Text(
          'تقييمات',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
            decoration: TextDecoration.underline,
            decorationColor: Colors.grey,
            decorationThickness: 1,
          ),
        ),

        Spacer(),

        // SKU
        Text(
          "$sku : SKU",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
