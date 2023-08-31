import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 0)
class Article extends HiveObject {
  // @HiveField(0)
  // final Source? source;
  @HiveField(0)
  final String? author;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? url;
  @HiveField(4)
  final String? urlToImage;
  @HiveField(5)
  final String? publishedAt;
  @HiveField(6)
  final String? content;

  Article({
    // this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  compareTo(Article b) {}
  factory Article.fromJson(Map<String, dynamic> json) => Article(
        // source: json['source'] == null
        //     ? null
        //     : Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        // 'source': source?.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };

  }

