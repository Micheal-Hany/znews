import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:znews/constants.dart';

part 'interrest_state.dart';

class InterrestCubit extends Cubit<InterrestState> {
  List<String> interestsList = [];

  InterrestCubit() : super(InterrestInitial());
  featchInterrest() async {
    var interestBox = Hive.box<String>(kinterestListBox);

    if (interestBox.isEmpty && interestsList.isEmpty) {
      for (int i = 0; i < interests.length; i++) {
        interestBox.add(interests[i]);
      }
    }

    interestsList = interestBox.values.cast<String>().toList();
    if (interestsList.isEmpty) {
      emit(InterrestEmpty());
    } else {
      emit(InterrestSuccess());
    }
  }
}
