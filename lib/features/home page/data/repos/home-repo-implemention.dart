// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:znews/constants.dart';
import 'package:znews/core/errors/Failure.dart';
import 'package:znews/core/utils/api-service.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';

import 'home-repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, List<Article>>> fatchCategoryNews(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              '?q=$category&from=${getTimeBeforeDays(3)}&to=${getCurrentTime()}&sortBy=relevancy&apiKey=$apiKey');
      List<Article> newsList = [];

      for (var item in data['articles']) {
        newsList.add(Article.fromJson(item));
      }

      return right(newsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioExeption(e));
      } else {
        return left(ServerFalure(e.toString()));
      }
    }
  }

  Future<Either<Failure, List<Article>>> fatchSearchNews(
      {required String search}) async {
    try {
      var data = await apiService.get(
          endPoint:
              '?q=$search&from=${getTimeBeforeDays(7)}&to=${getCurrentTime()}&sortBy=relevancy&apiKey=$apiKey');
      List<Article> newsList = [];

      for (var item in data['articles']) {
        newsList.add(Article.fromJson(item));
      }

      return right(newsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioExeption(e));
      } else {
        return left(ServerFalure(e.toString()));
      }
    }
  }

  DateTime getCurrentTime() {
    return DateTime.now();
  }

  DateTime getTimeBeforeDays(int days) {
    return DateTime.now().subtract(Duration(days: days));
  }
}
