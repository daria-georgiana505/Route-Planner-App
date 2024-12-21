import 'package:get_it/get_it.dart';
import 'package:mobile_non_native/database/database.dart';

GetIt locator = GetIt.instance;

void setUp(){
  locator.registerLazySingleton(() => AppDb());
}