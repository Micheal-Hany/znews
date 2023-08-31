import 'package:flutter/material.dart';
import 'package:znews/constants.dart';
import 'package:znews/features/Interests%20page/persention/widgets/Interests%20page%20body.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ksecondPinkColor,
      body: CategoryViewbody(),
    );
  }
}
