import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooyaa_app/core/cubit/selection/selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionState());

  void selectLanguage(int index, String language) {
    emit(
      state.copyWith(
        selectedLanguageIndex: index,
        selectedLanguage: language,
      ),
    );
  }

  void selectLevel(int index, String level) {
    emit(
      state.copyWith(
        selectedLevelIndex: index,
        selectedLevel: level,
      ),
    );
  }

  void selectWhy(int index, String why) {
    emit(
      state.copyWith(
        selectedWhyIndex: index,
        selectedWhy: why,
      ),
    );
  }

  void selectZone(int index, String zone) {
    emit(
      state.copyWith(
        selectedZoneIndex: index,
        selectedZone: zone,
      ),
    );
  }

  void selectOld(int index, String old) {
    emit(
      state.copyWith(
        selectedOldIndex: index,
        selectedOld: old,
      ),
    );
  }
}
