import 'package:flutter/material.dart';

import 'package:znews/core/utils/style.dart';

import 'custom interest list view.dart';

class CategoryViewbody extends StatelessWidget {
  const CategoryViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Added this line
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Text(
                'Select Interests',
                style: Style.textStyle20.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const InterestsListView(),
            // CustomElvatedButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   name: 'Submit',
            // )
          ],
        ),
      ),
    );
  }
}
