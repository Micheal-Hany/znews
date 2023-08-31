import 'package:flutter/material.dart';

import '../../../Interests page/persention/interests view.dart';

class CustomCategoryIcon extends StatelessWidget {
  const CustomCategoryIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(.4),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(),
              ));
        },
        icon: Center(
            child: Image.asset(
          'assests/images/menu.png',
          width: 22,
          color: Colors.white,
        )),
      ),
    );
  }
}
