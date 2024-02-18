import 'package:drift/drift.dart';

class MessageTable extends Table {
  IntColumn get id => integer().nullable()();

  IntColumn get userId => integer()();

  IntColumn get senderId => integer()();

  TextColumn get content => text()();

  IntColumn get time => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
