import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:znews/constants.dart';
import 'package:znews/core/widgets/Custom%20error%20massage.dart';
import 'package:znews/core/widgets/custom%20loading%20indecator.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/prsentation/Manger/cubit/news_cubit.dart';
import 'package:znews/features/home%20page/prsentation/widget/content%20section/Custom%20news%20detalis%20item.dart';

class CustomNewsBody extends StatelessWidget {
  const CustomNewsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsSuccess) {
           
              List<Article> filteredNewsList = state.newsList
                  .where((article) =>
                      article.title != null &&
                      article.description != null &&
                      article.content != null)
                  .toList();

              return Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CustomNewsDetailesBody(
                    article: filteredNewsList[index],
                    randomColor: ksecondYelloColor,
                  );
                },
                itemCount: filteredNewsList.length,
                itemWidth: MediaQuery.of(context).size.width * .9,
                layout: SwiperLayout.STACK,
              );
            } else if (state is NewsFailure) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomErrorMassage(erorMassage: state.errorMassege));
            }
            return const CustomLoadingIndecator();
          },
        ),
      ),
    );
  }
}
