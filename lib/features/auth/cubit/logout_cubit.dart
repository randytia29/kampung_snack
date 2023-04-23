import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/shared_pref.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final SharedPref sharedPref;

  LogoutCubit({required SharedPref pref})
      : sharedPref = pref,
        super(LogoutInitial());

  void startLogout() async {
    emit(LogoutLoading());

    await sharedPref.clearAccessToken();

    emit(LogoutSuccess());
  }
}
