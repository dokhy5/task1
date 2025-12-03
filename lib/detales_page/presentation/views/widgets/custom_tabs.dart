import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabs({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.rtl,
        children: [
          _buildTab("المنتج", 0),
          _buildDivider(),
          _buildTab("التقييم", 1),
          _buildDivider(),
          _buildTab("مساعدة", 2),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.orange : Colors.black,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 22,
      width: 1,
      color: Colors.black.withOpacity(0.2),
    );
  }
}
