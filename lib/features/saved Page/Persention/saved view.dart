import 'package:flutter/material.dart';
import 'package:znews/constants.dart';

import 'widgets/saved news body.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kprimeColor,
      body: SavedVireBody(),
    );
  }
}
