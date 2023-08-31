import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znews/core/utils/style.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/saved%20Page/Persention/widgets/custom%20saved%20news%20detailes%20body.dart';
import 'package:znews/features/saved%20Page/cubit/cubit/news_cubit.dart';

class SavedVireBody extends StatefulWidget {
  const SavedVireBody({super.key});

  @override
  State<SavedVireBody> createState() => _SavedVireBodyState();
}

class _SavedVireBodyState extends State<SavedVireBody> {
  @override
  void initState() {
    BlocProvider.of<SavedNewsCubit>(context).featchSavedNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Saved News',
              style: Style.textStyle30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SavedNewsListView(),
        ],
      ),
    );
  }
}

class SavedNewsListView extends StatelessWidget {
  const SavedNewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedNewsCubit, SavedNewsState>(
        builder: (context, state) {
      if (state is SavedNewsInitialSuccess) {
        List<Article> savedNews =
            BlocProvider.of<SavedNewsCubit>(context).articles!;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.76,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: savedNews.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomSavedNewsDetailesBody(
                    article: savedNews[index],
                    randomColor: const Color.fromARGB(255, 249, 231, 175),
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is SavedNewsInitialEmpty) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 270),
          child: Center(
              child: Text(
            'There are no saved news articles',
            style:
                Style.textStyle20.copyWith(color: Colors.white, fontSize: 23),
          )),
        );
      }

      return const SizedBox();
    });
  }
}

 






//  ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: savedNews.length,
//           itemBuilder: (context, index) {
//             return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: CustomNewsDetailesBody(
//                     randomColor: const Color.fromARGB(255, 253, 233, 173),
//                     article: savedNews[index]));
//           },
//         ),