import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/config/config.dart';

class TextBoxCubit extends Cubit<String> {
  TextBoxCubit() : super("");

  void addMovement(String text) {
    if (state.length < Config.maxMovements) {
      emit(state + text);
    }
  }
}
