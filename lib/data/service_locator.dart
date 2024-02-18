import '../main.dart';
import 'local/db/app_database.dart';
import 'local/db/database/mobile.dart';

setupLocator() {
  getIt.registerSingleton<AppDatabase>(constructDb());
}

T getInstance<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
  Type? type,
}) =>
    getIt.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
      type: type,
    );
