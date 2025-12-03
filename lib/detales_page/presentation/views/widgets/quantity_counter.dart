import 'package:flutter/material.dart';

class BuyNowBar extends StatefulWidget {
  const BuyNowBar({super.key});

  @override
  State<BuyNowBar> createState() => _BuyNowBarState();
}

class _BuyNowBarState extends State<BuyNowBar> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// زرار اشترِ الآن
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'اشترِ الآن',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _squareBtn(Icons.add, () {
                  setState(() {
                    count++;
                  });
                }),
                Text(
                  "$count",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _squareBtn(Icons.remove, () {
                  if (count > 1) {
                    setState(() {
                      count--;
                    });
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// زرار مربع صغير
  Widget _squareBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
