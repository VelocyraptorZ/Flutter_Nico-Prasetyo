import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/contact_us_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;
  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = 'contactus';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'contactus_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
            FirstName TEXT,
            LastName TEXT,
            Email TEXT,
            Problem TEXT
        )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertContactUs(ContactUsModel contactusModel) async {
    final Database db = await database;
    await db.insert(_tableName, contactusModel.toMap());
  }

  Future<List<ContactUsModel>> getContactUs() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => ContactUsModel.fromMap(e)).toList();
  }

  Future<ContactUsModel> getContactUsById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => ContactUsModel.fromMap(e)).first;
  }

  Future<void> updateContactUs(ContactUsModel contactusModel) async {
    final db = await database;
    await db.update(
      _tableName,
      contactusModel.toMap(),
      where: 'id = ?',
      whereArgs: [contactusModel.id],
    );
  }

  Future<void> deleteContactUs(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
