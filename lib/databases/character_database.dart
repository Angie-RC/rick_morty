
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CharacterDatabase {
  final int version = 1;
  final String databaseName = 'characterv2.db';
  final String tableName = 'character';

  Database? _db;
  Future<Database> openDB() async {
    _db ??= await openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (database, version) {
      String query =
          'create table $tableName (id integer primary key , name text , image text)';
      database.execute(query);
    }, version: version);
    return _db as Database;
  }
  
}