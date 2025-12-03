import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// العنوان + زر الرجوع جنب بعض
          Row(
            children: const [
              Text(
                "ملابس / رجالي",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 23), // البادينج البسيط بين النص والسهم
              Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            ],
          ),

          /// أيقونة العربية في الناحية التانية
          const Icon(
            Icons.shopping_cart_outlined,
            size: 28,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
