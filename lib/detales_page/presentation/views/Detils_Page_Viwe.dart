import 'package:flutter/material.dart';
import 'package:task1/detales_page/presentation/views/widgets/Detils_Page_Body.dart';

class DetilsPageViwe extends StatelessWidget {
  final int productId;
  const DetilsPageViwe({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return DetilsPageBody(productId: productId);
  }
}
