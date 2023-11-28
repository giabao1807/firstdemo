import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        """CREATE TABLE datas(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        name TEXT, 
        imagePath TEXT
        )
        """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('datas.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(String name, String imagePath) async {
    final db = await DBHelper.db();
    final data = {'name': name, 'imagePath': imagePath};
    final id = await db.insert('datas', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;  
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();
    return db.query('datas', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();
    return db.query('datas', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id,  String name, String imagePath) async {
    final db = await DBHelper.db();

    final data = {'name': name, 'imagePath': imagePath};
    final result =
        await db.update('datas', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DBHelper.db();
    try {
      await db.delete("datas", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
