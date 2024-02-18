import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get name => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
