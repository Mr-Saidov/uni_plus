import 'package:uni_plus/data/remote/api_provider.dart';
import 'package:uni_plus/data/user_data.dart';

import '../main.dart';
import 'local/db/app_database.dart';
import 'local/db/database/mobile.dart';

setupLocator() {
  getIt.registerSingleton<AppDatabase>(constructDb());
  getIt.registerSingleton<UserData>(UserData.create());
  getIt.registerSingleton<ApiProvider>(ApiProvider.create());
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
