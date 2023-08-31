import 'package:flutter/material.dart';
import 'package:znews/constants.dart';

import 'widgets/Search view body.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kprimeColor,
      body: SearchViewBody(),
    );
  }
}
