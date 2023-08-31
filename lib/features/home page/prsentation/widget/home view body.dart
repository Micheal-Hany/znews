import 'package:flutter/material.dart';

import 'Custom app bar.dart';

import 'Tap Bar section/Custom category list view.dart';
import 'content section/custom news body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hightSize = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: hightSize * .06,
        ),
        const CustomAppBar(),
        SizedBox(
          height: hightSize * .02,
        ),
        const CustomCategorylistView(),
        SizedBox(
          height: hightSize * .005,
        ),
        const CustomNewsBody(),
        SizedBox(
          height: hightSize * .018,
        )
      ],
    );
  }
}
