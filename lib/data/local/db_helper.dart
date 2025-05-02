import 'package:punto_venta/core/constants/db_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;
  static const String _dbName = 'punto_venta.db';
  static const _dbVersion = 1;

  DBHelper._init();

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Inicializa la base de datos
  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    //await deleteDatabase(path);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // Crea las tablas en la base de datos
  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(DbConstants.createEspacioTable);
  }
}
