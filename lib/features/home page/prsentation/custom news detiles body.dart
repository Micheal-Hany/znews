import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:znews/core/utils/style.dart';
import 'package:znews/core/widgets/custom%20loading%20indecator.dart';
import 'package:znews/features/Interests%20page/persention/widgets/custom%20elvated%20button.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/prsentation/widget/content%20section/custom%20auther%20info.dart';
import 'package:znews/features/home%20page/prsentation/widget/content%20section/custom%20news%20action%20button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDetailedNewsBody extends StatelessWidget {
  const CustomDetailedNewsBody({
    Key? key,
    required this.article,
    required this.randomColor,
  }) : super(key: key);

  final Article article;
  final Color randomColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: randomColor,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowLeftLong,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  article.title ?? '',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Style.textStyle20.copyWith(
                    color: Colors.black,
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Published on ${article.publishedAt?.replaceAll('T', ' at ').replaceAll('Z', '') ?? ''}',
                    style: Style.textStyle14.copyWith(
                      color: Colors.black.withOpacity(.7),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomAutherInfo(auther: article.author ?? 'unknown'),
                const SizedBox(height: 15),
                Text(
                  _stripHtmlTags(article.description ?? ''),
                  style: Style.textStyle16.copyWith(
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: 'roboto',
                  ),
                ),
                Text(
                  _stripHtmlTags(article.content ?? ''),
                  style: Style.textStyle16.copyWith(
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: 'roboto',
                  ),
                ),
                const SizedBox(height: 25),
                CachedNetworkImage(
                  height: 250,
                  width: double.infinity,
                  imageUrl: article.urlToImage ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6at7RwZOM_yVpsUZWimO0o75bYbKAE1DaTg&usqp=CAU',
                  placeholder: (context, url) {
                    return const CustomLoadingIndecator().build(context);
                  },
                  alignment: Alignment.center,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElvatedButton(
                  name: 'View All Details..',
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse(article.url ?? ''),
                      mode: LaunchMode.inAppWebView,
                      webViewConfiguration:
                          const WebViewConfiguration(enableJavaScript: false),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomNewsActionButtons(
                    newsUrl: article.url ?? '', article: article),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _stripHtmlTags(String htmlString) {
    return htmlString
        .replaceAll(RegExp('<.*?>'), '') // Remove all HTML tags
        .replaceAll('\n', '') // Remove newline characters
        .replaceAll('\r', '') // Remove carriage return characters
        .replaceAll('&nbsp;', '');
  } // Remove
}
