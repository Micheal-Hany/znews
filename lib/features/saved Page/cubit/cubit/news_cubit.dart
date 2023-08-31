import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:znews/constants.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';

part 'news_state.dart';

class SavedNewsCubit extends Cubit<SavedNewsState> {
  SavedNewsCubit() : super(SavedNewsInitial());
  List<Article>? articles;

  featchSavedNews() async {
    var box = Hive.box(kboxName);
    articles = box.values.cast<Article>().toList();

    articles!.isEmpty
        ? emit(SavedNewsInitialEmpty())
        : emit(SavedNewsInitialSuccess());
  }
}
