import 'package:drift/web.dart';

import '../app_database.dart';

AppDatabase constructDb({bool logStatements = false}) {
  return AppDatabase.create(WebDatabase('db', logStatements: logStatements));
}
