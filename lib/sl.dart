import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/cubit/login_cubit.dart';
import 'features/auth/cubit/logout_cubit.dart';
import 'utils/shared_pref.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Shared Preference
  final sharedPreferences = await SharedPreferences.getInstance();

  //! Features
  // Bloc

  // Auth
  sl.registerFactory(() => LoginCubit(pref: sl()));
  sl.registerFactory(() => LogoutCubit(pref: sl()));

  // Repository
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dio: sl()));

  //! External
  sl.registerLazySingleton(
      () => SharedPref(sharedPreferences: sharedPreferences));
}
