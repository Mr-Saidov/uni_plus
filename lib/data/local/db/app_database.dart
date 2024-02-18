import 'package:drift/drift.dart';
import 'package:uni_plus/data/local/db/tables/message_table.dart';
import 'package:uni_plus/data/local/db/tables/user_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [UserTable, MessageTable])
class AppDatabase extends _$AppDatabase {
  // Attention!!!
  // Don't use create or default constructor. Use getInstance() method to get AppDatabase object
  factory AppDatabase.create(QueryExecutor executor) => AppDatabase._(executor);

  AppDatabase._(QueryExecutor executor) : super(
            // EncryptedExecutor.inDatabaseFolder(
            //   path: "app.db",
            //   logStatements: true,
            //   singleInstance: true,
            //   password: "goCoder_Pass",
            // ),
            executor);

  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onUpgrade: (Migrator m, int from, int to) async {
        for (int i = 0; i < allTables.length; i++) {
          await m.drop(allTables.elementAt(i));
        }
        await m.createAll();
      });

  Future<int> insertUserTable(UserTableData userTableData) =>
      into(userTable).insert(userTableData, mode: InsertMode.insertOrReplace);

  Future updateUser(UserTableData userTableData) =>
      update(userTable).replace(userTableData);

  Future<int> deleteUser(UserTableData userTableData) =>
      (delete(userTable)..where((t) => t.id.equals(userTableData.id ?? 0)))
          .go();

  Stream<List<UserTableData>> watchUsers() => (select(userTable).watch());

  Future<int> insertMessageTable(MessageTableData messageTableData) =>
      into(messageTable)
          .insert(messageTableData, mode: InsertMode.insertOrReplace);

  Future updateMessage(MessageTableData messageTableData) =>
      update(messageTable).replace(messageTableData);

  Future<int> deleteMessage(MessageTableData messageTableData) =>
      (delete(messageTable)
            ..where((t) => t.id.equals(messageTableData.id ?? 0)))
          .go();

  Future<int> deleteMessagesByUserId(int userId) =>
      (delete(messageTable)..where((t) => t.userId.equals(userId))).go();

  Stream<List<MessageTableData>> watchMessages(int userId) =>
      ((select(messageTable)..where((tbl) => tbl.userId.equals(userId)))
          .watch());
}
