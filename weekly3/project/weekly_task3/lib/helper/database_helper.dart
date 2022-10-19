import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/reservation_model.dart';

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

  final String _tableName = 'reservations';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'reservation_db.db'),
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

  Future<void> insertReservation(ReservationModel reservationModel) async {
    final Database db = await database;
    await db.insert(_tableName, reservationModel.toMap());
  }

  Future<List<ReservationModel>> getReservation() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => ReservationModel.fromMap(e)).toList();
  }

  Future<ReservationModel> getReservationById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => ReservationModel.fromMap(e)).first;
  }

  Future<void> updateReservation(ReservationModel reservationModel) async {
    final db = await database;
    await db.update(
      _tableName,
      reservationModel.toMap(),
      where: 'id = ?',
      whereArgs: [reservationModel.id],
    );
  }

  Future<void> deleteReservation(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
