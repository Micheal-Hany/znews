import 'package:flutter/material.dart';
import 'package:znews/core/utils/style.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/prsentation/custom%20news%20detiles%20body.dart';
import 'package:znews/features/saved%20Page/Persention/widgets/custom%20saved%20news%20action%20button.dart';

class CustomSavedNewsDetailesBody extends StatelessWidget {
  const CustomSavedNewsDetailesBody(
      {super.key, required this.randomColor, required this.article});

  final Color randomColor;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomDetailedNewsBody(
                  article: article, randomColor: randomColor),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: randomColor, borderRadius: BorderRadius.circular(8)),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                article.title ?? '',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: Style.textStyle20.copyWith(
                    color: Colors.black,
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 33),
              ),
              const SizedBox(
                height: 10,
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'Published on ${article.publishedAt!.replaceAll('T', ' at ').replaceAll('Z', '')}',
              //     style: Style.textStyle14
              //         .copyWith(color: Colors.black.withOpacity(.7)),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // CustomAutherInfo(auther: article.author ?? 'Unknown'),
              // const SizedBox(
              //   height: 15,
              // ),
              Text(
                article.description ?? '',
                style: Style.textStyle16.copyWith(
                  fontSize: 17,
                  color: Colors.black,
                  fontFamily: 'roboto',
                ),
              ),
              Text(
                article.content ?? '',
                style: Style.textStyle16.copyWith(
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: 'roboto',
                    overflow: TextOverflow.ellipsis),
                maxLines: 2,
              ),
              const Spacer(),
              CustomSavedNewsActionButtons(
                  newsUrl: article.url ?? '', article: article),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
