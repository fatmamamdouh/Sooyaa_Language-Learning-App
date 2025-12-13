import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/password/pass_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(const PasswordState());

  void togglePass() {
    emit(state.copyWith(isPassVisible: !state.isPassVisible));
  }

  void toggleConPass() {
    emit(state.copyWith(isConPassVisible: !state.isConPassVisible));
  }
}


