import 'package:drift/drift.dart';

class RegionTable extends Table {
  IntColumn get code => integer().nullable()();

  TextColumn get nameUz => text().named("nameUz")();

  TextColumn get nameRu => text().named("nameRu")();

  TextColumn get nameLatn => text().named("nameLatn")();

  IntColumn get ord => integer().named("ord")();

  @override
  Set<Column<Object>>? get primaryKey => {code};
}
