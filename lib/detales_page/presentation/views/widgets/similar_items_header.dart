import 'package:flutter/material.dart';

class SimilarItemsHeader extends StatelessWidget {
  const SimilarItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(thickness: 1, color: Colors.grey, endIndent: 10),
        ),
        Text(
          'عناصر مماثلة',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.grey, indent: 10)),
      ],
    );
  }
}
