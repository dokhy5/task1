import 'package:flutter/material.dart';

class ProductImageCard extends StatefulWidget {
  const ProductImageCard({super.key});

  @override
  State<ProductImageCard> createState() => _ProductImageCardState();
}

class _ProductImageCardState extends State<ProductImageCard> {
  final PageController _controller = PageController();

  /// الصور اللي هتتنقل بينهم
  final List<String> images = [
    "Images/3.png",
    "Images/3.png",
    "Images/3.png",
    "Images/3.png",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  images[index],
                  width: 260,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        /// ----- Icons -----
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.favorite_border, size: 28),
              Icon(Icons.share_outlined, size: 28),
            ],
          ),
        ),

        const SizedBox(height: 18),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            bool isActive = index == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 10 : 8,
              height: isActive ? 10 : 8,
              decoration: BoxDecoration(
                color:
                    isActive ? Colors.orange : Colors.orange.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
