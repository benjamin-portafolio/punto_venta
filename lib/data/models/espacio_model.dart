import 'package:uuid/uuid.dart';

class Espacio {
  final String id;
  final String nombre;
  final String syncStatus;
  final int version;

  // Campos locales
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool isDirty;

  // Campos del servidor
  final DateTime? serverCreatedAt;
  final DateTime? serverUpdatedAt;
  final DateTime? serverDeletedAt;

  Espacio({
    required this.nombre,
    String? id,
    this.syncStatus = 'pending',
    this.version = 1,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
    this.isDirty = true,
    this.serverCreatedAt,
    this.serverUpdatedAt,
    this.serverDeletedAt,
  }) : id = (id == null || id.isEmpty) ? Uuid().v4() : id,
       createdAt = createdAt ?? DateTime.now().toUtc(),
       updatedAt = updatedAt ?? DateTime.now().toUtc();

  // Constructor para datos del servidor
  factory Espacio.fromServerJson(Map<String, dynamic> json) {
    return Espacio(
      id: json['id'],
      nombre: json['nombre'],
      syncStatus: 'synced',
      version: json['version'],
      isDirty: false,
      createdAt: _parseDateTime(json['created_at']),
      updatedAt: _parseDateTime(json['updated_at']),
      deletedAt: _parseDateTime(json['deleted_at']),
      serverCreatedAt: _parseDateTime(json['created_at']),
      serverUpdatedAt: _parseDateTime(json['updated_at']),
      serverDeletedAt: _parseDateTime(json['deleted_at']),
    );
  }
  factory Espacio.fromMap(Map<String, dynamic> map) {
    return Espacio(id: map['id'], nombre: map['nombre']);
  }

  static DateTime? _parseDateTime(dynamic date) {
    if (date == null) return null;
    final String formattedDate = date.toString().replaceFirst(' ', 'T');
    return DateTime.parse(formattedDate).toUtc();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'sync_status': syncStatus,
      'version': version,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'is_dirty': isDirty ? 1 : 0,
      'server_created_at': serverCreatedAt?.toIso8601String(),
      'server_updated_at': serverUpdatedAt?.toIso8601String(),
      'server_deleted_at': serverDeletedAt?.toIso8601String(),
    };
  }
}
