part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<Article> newsList;

  const NewsSuccess({required this.newsList});
}

final class NewsFailure extends NewsState {
  final String errorMassege;

  const NewsFailure({required this.errorMassege});
}
