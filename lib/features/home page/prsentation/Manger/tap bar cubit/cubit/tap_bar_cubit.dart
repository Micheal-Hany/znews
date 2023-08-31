import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:znews/constants.dart';

part 'tap_bar_state.dart';

class TapBarCubit extends Cubit<TapBarState> {
  List<String> tapBarListView = [];

  TapBarCubit() : super(TapBarInitial());
  fetchTapBarListView() async {
    String genral = 'Trending';

    var box = Hive.box<String>(ktapBarBox);

    box.isEmpty ? box.add(genral) : box;

    tapBarListView = box.values.cast<String>().toList();

    emit(TapBarSucess());
  }
}
