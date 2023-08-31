import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/data/repos/home-repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.homeRepo) : super(NewsInitial());
  final HomeRepo homeRepo;
  Future<void> featchNewsFromInternet({required String categoty}) async {
    emit(NewsLoading());
      var result = (await homeRepo.fatchCategoryNews(category: categoty));
      result.fold((failure) {
        emit(NewsFailure(errorMassege: failure.errorMasssage));
      }, (newsList) => emit(NewsSuccess(newsList: newsList)));
  }
}
