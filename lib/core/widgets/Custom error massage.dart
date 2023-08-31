// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:znews/core/utils/style.dart';

class CustomErrorMassage extends StatelessWidget {
  const CustomErrorMassage({
    Key? key,
    required this.erorMassage,
  }) : super(key: key);
  final String erorMassage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        erorMassage,
        style: Style.textStyle30.copyWith(color: Colors.white),
      ),
    );
  }
}
