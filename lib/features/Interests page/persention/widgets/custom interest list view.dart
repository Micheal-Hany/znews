import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znews/features/Interests%20page/cubit/interrest_cubit.dart';

import 'custom interests item.dart';

class InterestsListView extends StatelessWidget {
  const InterestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .88,
      child: BlocBuilder<InterrestCubit, InterrestState>(
        builder: (context, state) {
          if (state is InterrestSuccess) {
            List<String> interest =
                BlocProvider.of<InterrestCubit>(context).interestsList;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: interest.length,
              itemBuilder: (context, index) {
                return InterestsItem(
                  interest: interest[index],
                );
              },
            );
          } else if (state is InterrestEmpty) {
            return const Center(
              child: Text(
                "You Added all Interestes...",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
