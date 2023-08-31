import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:znews/constants.dart';

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 60,
      child: LoadingIndicator(
          indicatorType: Indicator.ballBeat,

          /// Required, The loading type of the widget
          colors: [Colors.white],

          /// Optional, The color collections
          strokeWidth: 20,

          /// Optional, The stroke of the line, only applicable to widget which contains line
          // backgroundColor: kprimeColor,

          /// Optional, Background of the widget
          pathBackgroundColor: kprimeColor

          /// Optional, the stroke backgroundColor
          ),
    ));
  }
}
