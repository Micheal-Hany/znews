import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:znews/constants.dart';
import 'package:znews/core/utils/style.dart';
import 'package:znews/features/Interests%20page/cubit/interrest_cubit.dart';

import 'package:znews/features/home%20page/prsentation/Manger/tap%20bar%20cubit/cubit/tap_bar_cubit.dart';

class InterestsItem extends StatefulWidget {
  const InterestsItem({super.key, required this.interest});
  final String interest;

  @override
  State<InterestsItem> createState() => _InterestsItemState();
}

class _InterestsItemState extends State<InterestsItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(200),
            ),
            child: IconButton(
              onPressed: () async {
                setState(() {
                  isSelected = !isSelected;
                });
                await addTapBarItemForOneTimeToTabBarView();
                await deleteInterestFromInterestsListView();
                isSelected = false;
                BlocProvider.of<InterrestCubit>(context).featchInterrest();
                BlocProvider.of<TapBarCubit>(context).fetchTapBarListView();
               
                // BlocProvider.of<SavedNewsCubit>(context).featchSavedNews();
              },
              icon: isSelected
                  ? Image.asset(
                      'assests/images/correct.png',
                    )
                  : const Icon(null),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * .7,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.interest,
                  style: Style.textStyle20.copyWith(color: kprimeColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addTapBarItemForOneTimeToTabBarView() async {
    var box = Hive.box<String>(ktapBarBox);
    if (isSelected) {
      bool valueExists = box.values.contains(widget.interest);
      if (!valueExists) {
        await box.add(widget.interest);
      }
    } else {
      await box.delete(widget.interest);
    }
  }

  Future<void> deleteInterestFromInterestsListView() async {
    var interestBox = Hive.box<String>(kinterestListBox);
    int indexToDelete = interestBox.values.toList().indexOf(widget.interest);

    await interestBox.deleteAt(indexToDelete);
  }
}
