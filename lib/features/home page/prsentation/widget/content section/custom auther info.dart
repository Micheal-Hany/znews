import 'package:flutter/material.dart';
import 'package:znews/core/utils/style.dart';

class CustomAutherInfo extends StatelessWidget {
  const CustomAutherInfo({super.key, required this.auther});
  final String auther;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset('assests/images/avtar image.png'),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Published by',
              style: Style.textStyle14
                  .copyWith(color: Colors.black.withOpacity(.7)),
            ),
            Text(auther.length < 32 ? auther : auther.substring(0, 31),
                style: Style.textStyle16.copyWith(color: Colors.black))
          ],
        )
      ],
    );
  }
}
