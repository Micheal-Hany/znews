import 'package:flutter/material.dart';
import 'package:znews/core/utils/style.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/prsentation/custom%20news%20detiles%20body.dart';

import 'custom auther info.dart';
import 'custom news action button.dart';

class CustomNewsDetailesBody extends StatelessWidget {
  const CustomNewsDetailesBody(
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
            color: randomColor, borderRadius: BorderRadius.circular(24)),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                article.title ?? '',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: Style.textStyle20.copyWith(
                  color: Colors.black,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Published on ${article.publishedAt?.replaceAll('T', ' at ').replaceAll('Z', '') ?? ''}',
                  style: Style.textStyle14
                      .copyWith(color: Colors.black.withOpacity(.7)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomAutherInfo(auther: article.author ?? 'Unknown'),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.description ??
                    ''
                        .replaceAll('<ul>', '')
                        .replaceAll('<li>', '')
                        .replaceAll('</li>', '')
                        .replaceAll('</ul>', '')
                        .replaceAll('tr>', '')
                        .replaceAll('<td>', '')
                        .replaceAll('/tr>', '')
                        .replaceAll('</td>', '')
                        .replaceAll('>', '')
                        .replaceAll('<', '')
                        .replaceAll('/', ''),
                style: Style.textStyle16.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'roboto',
                ),
                maxLines: 6,
              ),
              Text(
                article.content ??
                    ''
                        .replaceAll('<ul>', '')
                        .replaceAll('<li>', '')
                        .replaceAll('</li>', '')
                        .replaceAll('</ul>', '')
                        .replaceAll('tr>', '')
                        .replaceAll('<td>', '')
                        .replaceAll('/tr>', '')
                        .replaceAll('</td>', '')
                        .replaceAll('>', '')
                        .replaceAll('<', '')
                        .replaceAll('/', '')
                        .replaceAll('  ', ''),
                style: Style.textStyle16.copyWith(
                  fontSize: 17,
                  color: Colors.black,
                  fontFamily: 'roboto',
                  overflow: TextOverflow.ellipsis,
                ),
                softWrap: true,
                maxLines: 6,
              ),
              const Spacer(),
              CustomNewsActionButtons(
                  newsUrl: article.url ?? '', article: article),
              SizedBox(
                height: MediaQuery.of(context).size.height * .005,
              )
            ],
          ),
        ),
      ),
    );
  }
}
