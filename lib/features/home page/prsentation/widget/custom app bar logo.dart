import 'package:flutter/material.dart';
import 'package:znews/core/utils/style.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 37,
            width: 37,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Z',
                style: Style.textStyle30.copyWith(
                  color: Colors.black,
                  fontFamily: 'Caprasimo',
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            'News',
            style: Style.textStyle30.copyWith(
                fontFamily: 'roboto',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 26),
          ),
        ],
      ),
    );
  }
}
