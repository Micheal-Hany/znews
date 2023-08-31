import 'package:flutter/material.dart';

import 'Custom app bar category icon.dart';
import 'custom app bar logo.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          CustomAppLogo(),
          Spacer(),
          CustomCategoryIcon(),
        ],
      ),
    );
  }
}
