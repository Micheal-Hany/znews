import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:znews/core/errors/Failure.dart';
import 'package:znews/core/widgets/Custom%20error%20massage.dart';
import 'package:znews/core/widgets/custom%20loading%20indecator.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/prsentation/custom%20news%20detiles%20body.dart';

class CustomSerchViewBody extends StatelessWidget {
  final String searchname;
  final Future<Either<Failure, List<Article>>> searchFuture;

  const CustomSerchViewBody({
    required this.searchname,
    required this.searchFuture,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<Failure, List<Article>>>(
      future: searchFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final Either<Failure, List<Article>> result = snapshot.data!;
          return result.fold(
            (failure) => Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .3,
              ),
              child: const CustomErrorMassage(
                erorMassage: 'Enter search words...',
              ),
            ),
            (articles) {
              articles.removeWhere((article) => article.title == null);
              return SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: articles
                        .map((article) => customDisplaySearchNews(
                              article: article,
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingIndecator();
        }
        return const SizedBox();
      },
    );
  }
}

class customDisplaySearchNews extends StatelessWidget {
  const customDisplaySearchNews({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomDetailedNewsBody(
                  article: article,
                  randomColor: const Color(0xffFFF6DC),
                ),
              ));
        },
        child: ListTile(
          title: Text(article.title!),
          titleTextStyle: const TextStyle(fontSize: 20),
          subtitle: Text(article.description ?? ''),
        ),
      ),
    );
  }
}
