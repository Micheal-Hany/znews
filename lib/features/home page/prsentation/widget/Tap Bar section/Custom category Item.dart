import 'package:flutter/material.dart';
import 'package:znews/core/utils/style.dart';

class CustomCategoryitem extends StatelessWidget {
  const CustomCategoryitem({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(),
      child: Text(
        categoryName,
        style: Style.textStyle16.copyWith(
          fontFamily: 'roboto',
        ),
      ),
    );
  }
}

// class CustomCategorylistView extends StatelessWidget {
//   const CustomCategorylistView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 25),
//       height: 40,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categorylist.length,
//         itemBuilder: (context, index) {
//           return Align(
//             alignment: Alignment.center,
//             child: CustomCategoryitem(
//               categoryName: categorylist[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
