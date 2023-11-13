
//import 'package:rick_morty/models/character.dart';
import 'package:rick_morty/databases/character_database.dart';
import 'package:rick_morty/models/character.dart';
import 'package:sqflite/sqflite.dart';

class CharacaterRepository {
  insert(Character character) async {
    Database db = await CharacterDatabase().openDB();
    await db.insert(CharacterDatabase().tableName, character.toMap());
  }

  delete(Character character) async {
    Database db = await CharacterDatabase().openDB();
    await db
        .delete(CharacterDatabase().tableName, where: 'id=?', whereArgs: [character.id]);
  }

  Future<bool> isFavorite(Character character) async {
    Database db = await CharacterDatabase().openDB();
    List maps = await db
        .query(CharacterDatabase().tableName, where: 'id=?', whereArgs: [character.id]);

    return maps.isNotEmpty;
  }

  
  Future<List<Character>> getAll() async {
    Database db = await CharacterDatabase().openDB();
    final maps = await db.query(CharacterDatabase().tableName);
    return maps.map((map) => Character.fromMap(map)).toList();
  }
}


