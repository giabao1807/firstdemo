import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'listview.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._privateConstructor();
  static Database? _database;

  DBHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'images.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE images(
        id INTEGER PRIMARY KEY,
        name TEXT,
        imagePath TEXT
      )
    ''');
  }

  Future<int> insertData(MyData data) async {
    Database db = await instance.database;
    return await db.insert('images', data.toMap());
  }

  Future<List<MyData>> getData() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('images');
    return List.generate(maps.length, (i) {
      return MyData.fromMap(maps[i]);
    });
  }

  Future<void> deleteData(int id) async {
    Database db = await instance.database;
    await db.delete('images', where: 'id = ?', whereArgs: [id]);
  }
}
