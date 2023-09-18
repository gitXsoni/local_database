import 'package:database_class/models/app_db.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => MyDb());
}
