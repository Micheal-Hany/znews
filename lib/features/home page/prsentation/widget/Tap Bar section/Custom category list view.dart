import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:znews/constants.dart';
import 'package:znews/core/utils/style.dart';
import 'package:znews/features/Interests%20page/cubit/interrest_cubit.dart';
import 'package:znews/features/home%20page/prsentation/Manger/cubit/news_cubit.dart';
import 'package:znews/features/home%20page/prsentation/Manger/tap%20bar%20cubit/cubit/tap_bar_cubit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomCategorylistView extends StatefulWidget {
  const CustomCategorylistView({Key? key}) : super(key: key);

  @override
  _CustomCategorylistViewState createState() => _CustomCategorylistViewState();
}

class _CustomCategorylistViewState extends State<CustomCategorylistView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String selectedValue = 'Trending';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: interests.length + 1, vsync: this);
    _tabController!.addListener(_handleTabSelection);
    BlocProvider.of<NewsCubit>(context)
        .featchNewsFromInternet(categoty: selectedValue);
    BlocProvider.of<TapBarCubit>(context).fetchTapBarListView();
    BlocProvider.of<InterrestCubit>(context).featchInterrest();
  }

  void _handleTabSelection() {
    setState(() {
      selectedValue = BlocProvider.of<TapBarCubit>(context)
          .tapBarListView[_tabController!.index];
    });
    BlocProvider.of<NewsCubit>(context)
        .featchNewsFromInternet(categoty: selectedValue);
  }

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabSelection);
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TapBarCubit, TapBarState>(
      builder: (context, state) {
        if (state is TapBarSucess) {
          List<String> tapBarList =
              BlocProvider.of<TapBarCubit>(context).tapBarListView;
          print(tapBarList);
          return TabBar(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelColor: Colors.white,
            controller: _tabController,
            isScrollable: true,
            tabs: tapBarList
                .map((category) => GestureDetector(
                    onLongPress: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.warning,
                        body: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Do you Want to Delete $category from Interests...',
                              style: Style.textStyle16
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        btnOkOnPress: () async {
                          await backToInterestsListView(category);
                          await DeleteFromTapBarListView(category, context);
                        },
                        btnCancelOnPress: () {},
                      ).show();
                    },
                    child: Tab(text: category)))
                .toList(),
            indicator: const BoxDecoration(),
            labelStyle: const TextStyle(
              fontSize: 22,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Future<void> DeleteFromTapBarListView(
      String category, BuildContext context) async {
    var box = Hive.box<String>(ktapBarBox);

    int indexToDelete = box.values.toList().indexOf(category);

    int currentIndex = _tabController!.index;

    await box.deleteAt(indexToDelete);
    BlocProvider.of<TapBarCubit>(context).fetchTapBarListView();
    BlocProvider.of<InterrestCubit>(context).featchInterrest();

    if (indexToDelete == currentIndex) {
      _tabController!.index = indexToDelete == 0 ? 0 : indexToDelete - 1;
    }
  }

  Future<void> backToInterestsListView(String category) async {
    var interestBox = Hive.box<String>(kinterestListBox);
    await interestBox.add(category);
  }
}
