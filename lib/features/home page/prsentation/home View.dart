import 'package:flutter/material.dart';
import 'package:znews/constants.dart';
import 'package:znews/features/home%20page/prsentation/widget/home%20view%20body.dart';

class HomeView extends StatelessWidget {
    HomeView({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      backgroundColor: kprimeColor,
    );
  }
}
