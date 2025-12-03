import 'package:flutter/material.dart';

class DescriptionRow extends StatefulWidget {
  final String description; // النص المطلوب

  const DescriptionRow({
    super.key,
    required this.description, // نجعلها required
  });

  @override
  State<DescriptionRow> createState() => _DescriptionRowState();
}

class _DescriptionRowState extends State<DescriptionRow> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // النصوص من اليمين
      children: [
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'الوصــف',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            IconButton(
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ],
        ),

        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.description,
              textDirection: TextDirection.rtl, // من اليمين للشمال
              style: TextStyle(
                fontSize: 13,
                height: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
