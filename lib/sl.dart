import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampung_snack/features/participant/cubit/form_participant_cubit.dart';
import 'package:kampung_snack/features/participant/cubit/participant_cubit.dart';
import 'package:kampung_snack/features/participant/cubit/participant_web_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/cubit/login_cubit.dart';
import 'features/auth/cubit/logout_cubit.dart';
import 'utils/image_pick_service.dart';
import 'utils/shared_pref.dart';

final sl = GetIt.instance;

Future<void> init(bool kIsWeb) async {
  // Shared Preference
  final sharedPreferences = await SharedPreferences.getInstance();

  //! Features
  // Bloc

  // Auth
  sl.registerFactory(() => LoginCubit(pref: sl()));
  sl.registerFactory(() => LogoutCubit(pref: sl()));

  // Participant
  sl.registerFactory(() => FormParticipantCubit());

  if (!kIsWeb) {
    sl.registerLazySingleton(() => ParticipantCubit());
  } else {
    sl.registerLazySingleton(() => ParticipantWebCubit());
  }

  // Repository
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dio: sl()));

  //! External
  sl.registerLazySingleton(
      () => SharedPref(sharedPreferences: sharedPreferences));
  sl.registerLazySingleton(() => ImagePickService(picker: ImagePicker()));
}
