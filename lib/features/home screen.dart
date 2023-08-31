import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:znews/constants.dart';
import 'package:znews/features/home%20page/prsentation/home%20View.dart';
import 'package:znews/features/saved%20Page/Persention/saved%20view.dart';

import 'Search Page/Persention/Search view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 0;
  List<bool> isSelected = [true, false, false];

  void selectScreen(int index) {
    setState(() {
      isSelected = List.generate(isSelected.length, (i) => i == index);
      screen = index;
    });
  }

  Widget buildIconButton(IconData iconData, int index) {
    final isSelectedIcon = isSelected[index];
    return InkWell(
      onTap: () => selectScreen(index),
      child: Container(
        decoration: BoxDecoration(
          color: isSelectedIcon ? Colors.white : Colors.grey.withOpacity(.1),
          border: Border.all(
            color: isSelectedIcon ? Colors.black : Colors.grey.withOpacity(.5),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(200),
        ),
        child: IconButton(
          onPressed: () => selectScreen(index),
          icon: Icon(
            iconData,
            size: 23,
            color: isSelectedIcon ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Container(
          color: kprimeColor,
          height: MediaQuery.of(context).size.height * .08,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildIconButton(FontAwesomeIcons.house, 0),
                buildIconButton(FontAwesomeIcons.magnifyingGlass, 1),
                buildIconButton(FontAwesomeIcons.solidBookmark, 2),
              ],
            ),
          ),
        ),
      ),
      body: screens[screen],
    );
  }

  List<Widget> screens = [HomeView(), const SearchView(), const SavedView()];
}
