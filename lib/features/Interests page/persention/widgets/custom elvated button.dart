import 'package:flutter/material.dart';
import 'package:znews/constants.dart';
import 'package:znews/core/utils/style.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton(
      {super.key, required this.name, required this.onPressed});
  final String name;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            kprimeColor,
          ),
        ),
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Center(
            child: Text(
              name,
              style: Style.textStyle20.copyWith(letterSpacing: 1.3),
            ),
          ),
        ));
  }
}
