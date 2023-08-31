import 'package:dartz/dartz.dart';
import 'package:znews/core/errors/Failure.dart';

import '../Models/news_model/article.dart';

abstract class HomeRepo {
  // Future<Either<Failure, List<NewsModel>>> fetkchNewstBooks();
  // Future<Either<Failure, List<NewsModel>>> fetkchFeaturedBooks();
  Future<Either<Failure, List<Article>>> fatchCategoryNews(
      {required String category});
}
