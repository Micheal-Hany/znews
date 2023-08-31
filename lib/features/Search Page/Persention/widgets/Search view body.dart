import 'package:flutter/material.dart';
import 'package:znews/core/utils/style.dart';

import 'custom search bar .dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Search News',
              style: Style.textStyle30,
            ),
            SizedBox(
              height: 20,
            ),
            CustomSearchBar(),
          ],
        ),
      ),
    );
  }
}
