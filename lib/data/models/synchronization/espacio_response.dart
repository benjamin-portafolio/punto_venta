class EspacioResponse {
  EspacioResponse({
    this.id,
    this.nombre,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.version,
    this.lastSyncAt,
    this.createdBy,
    this.updatedBy,
  });

  String? id;
  String? nombre;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  DateTime? lastSyncAt;
  String? createdBy;
  String? updatedBy;
  String? descripcion;

  factory EspacioResponse.fromJson(
    Map<String, dynamic> json,
  ) => EspacioResponse(
    id: json["id"],
    nombre: json["nombre"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt:
        json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    version: json["version"],
    lastSyncAt:
        json["last_sync_at"] == null
            ? null
            : DateTime.parse(json["last_sync_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
  );

  /* Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "estado": estado,
    "fechaCreacion": fechaCreacion?.toIso8601String(),
    "fechaModificacion": fechaModificacion?.toIso8601String(),
  };*/
}
