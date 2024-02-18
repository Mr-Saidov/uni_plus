import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;

import '../../../../utils/utils.dart';
import '../app_database.dart';

AppDatabase constructDb({bool logStatements = true, String? path}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      // final deviceId = await getDeviceId();
      // return EncryptedExecutor.inDatabaseFolder(
      //   path: dbFile.path,
      //   password: deviceId,
      //   logStatements: logStatements,
      //   singleInstance: true,
      // );
      return NativeDatabase(dbFile, logStatements: true);
    });
    return AppDatabase.create(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    debugLog("Database path ${file.path}");
    return AppDatabase.create(
      NativeDatabase(
        file,
        logStatements: true,
      ),
    );
  }
  if (Platform.isWindows) {
    final file = File('db.sqlite');
    return AppDatabase.create(
        NativeDatabase(file, logStatements: logStatements));
  }
  return AppDatabase.create(
      NativeDatabase.memory(logStatements: logStatements));
}
