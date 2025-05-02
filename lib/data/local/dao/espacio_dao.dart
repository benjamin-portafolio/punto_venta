import 'package:punto_venta/core/constants/db_constants.dart';
import 'package:punto_venta/data/models/espacio_model.dart';
import 'package:sqflite/sqflite.dart';

class EspacioDao {
  // Singleton pattern

  Future<List<Espacio>> obtenerEspacios(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query('espacio');
    if (maps.isEmpty) {
      return [];
    }
    return maps.map((map) => Espacio.fromMap(map)).toList();
  }

  Future<int> insertOrUpdateEspacio(Espacio espacio, Database db) async {
    return await db.insert(
      DbConstants.espacioTable,
      espacio.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> bulkSyncEspacios(List<Espacio> espacios, Database db) async {
    await db.transaction((txn) async {
      for (final espacio in espacios) {
        await txn.insert(
          DbConstants.espacioTable,
          espacio.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }
}
