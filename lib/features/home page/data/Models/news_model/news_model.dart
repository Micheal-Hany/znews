import 'package:equatable/equatable.dart';

import 'article.dart';

class NewsModel extends Equatable {
  final List<Article>? articles;

  const NewsModel({this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'articles': articles?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [articles];
}
