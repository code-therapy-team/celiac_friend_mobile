
import 'package:flutter/material.dart';

class WidgetLoadingPagination extends StatelessWidget {
  const WidgetLoadingPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
      height: 60,
      child: Center(child:CircularProgressIndicator()),
    ),);
  }
}