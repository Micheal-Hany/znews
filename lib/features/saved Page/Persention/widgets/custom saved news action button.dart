import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/prsentation/widget/content%20section/custom%20news%20action%20item.dart';
import 'package:znews/features/saved%20Page/cubit/cubit/news_cubit.dart';
import 'package:share_plus/share_plus.dart';

class CustomSavedNewsActionButtons extends StatelessWidget {
  const CustomSavedNewsActionButtons({
    required this.newsUrl,
    required this.article,
    super.key,
  });
  final String newsUrl;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomNewsActionItem(
          onPressed: () {},
          iconDataTrue: FontAwesomeIcons.thumbsUp,
          iconDataFalse: FontAwesomeIcons.solidThumbsUp,
        ),
        const SizedBox(
          width: 5,
        ),
        CustomNewsActionItem(
          onPressed: () {
            article.delete();
            BlocProvider.of<SavedNewsCubit>(context).featchSavedNews();
            
          },
          iconDataTrue: FontAwesomeIcons.solidBookmark,
          iconDataFalse: FontAwesomeIcons.solidBookmark,
        ),
        const SizedBox(
          width: 5,
        ),
        CustomNewsActionItem(
          onPressed: () async {
            await Share.share(newsUrl);
          },
          iconDataTrue: FontAwesomeIcons.share,
          iconDataFalse: FontAwesomeIcons.share,
        ),
      ],
    );
  }
}
