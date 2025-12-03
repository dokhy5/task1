import 'package:flutter/material.dart';

class SimilarProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String oldPrice;
  final String newPrice;
  final VoidCallback onBuyPressed;
  final VoidCallback onFavoritePressed;

  const SimilarProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.onBuyPressed,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          // صورة المنتج
          Image.asset(
            imagePath,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),

          // عنوان المنتج
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
            textAlign: TextAlign.right,
          ),
          Text(
            oldPrice,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.red,
              decoration: TextDecoration.lineThrough,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            newPrice,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onFavoritePressed,
                icon: const Icon(Icons.favorite_border, size: 20),
              ),
              ElevatedButton(
                onPressed: onBuyPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(100, 30),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
                child: const Text(
                  'اشتر الآن',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
