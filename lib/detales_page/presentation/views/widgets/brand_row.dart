import 'package:flutter/material.dart';

class BrandRow extends StatelessWidget {
  final String brandName;
  final VoidCallback onMorePressed;

  const BrandRow({
    Key? key,
    required this.brandName,
    required this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Text(
          'الماركة : $brandName',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        ),
        Spacer(),
        TextButton.icon(
          onPressed: onMorePressed,
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 16,
          ),
          label: Text(
            'المزيد',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
