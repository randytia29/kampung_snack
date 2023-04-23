import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/shared_pref.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SharedPref sharedPref;

  LoginCubit({required SharedPref pref})
      : sharedPref = pref,
        super(LoginInitial());

  void startLogin(String username, String password) async {
    emit(LoginLoading());

    await sharedPref.setAccessToken(username + password);

    emit(LoginSuccess());
  }
}
