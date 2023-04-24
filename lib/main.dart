import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'app.dart';
import 'sl.dart' as sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    HydratedBloc.storage =
        await HydratedStorage.build(storageDirectory: appDocumentDirectory);
  }

  await sl.init(kIsWeb);

  runApp(const MyApp());
}
