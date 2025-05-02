class DbConstants {
  static const String dbName = 'app_database.db';
  static const int dbVersion = 1;

  // Table names
  static const String espacioTable = 'espacio';
  static const String productTable = 'product';

  // User table columns
  static const String userId = 'id';
  static const String userName = 'name';
  static const String userEmail = 'email';

  // Product table columns
  static const String productId = 'id';
  static const String productName = 'name';
  static const String productPrice = 'price';

  // Table creation queries
  static const String createEspacioTable = '''
      CREATE TABLE $espacioTable (
      
    -- UUID generado en el dispositivo (v4 o v7)
    id TEXT PRIMARY KEY,

    -- Nombre del espacio (ej: 'Terraza VIP')
    nombre TEXT NOT NULL,

    -- Estado de sincronización con el servidor
    sync_status TEXT NOT NULL DEFAULT 'synced' CHECK(sync_status IN ('synced', 'pending', 'error')),

    -- Versión del registro para control de concurrencia
    version INTEGER NOT NULL DEFAULT 1,

    -- Auditoría local (generados en el dispositivo)
    created_at TEXT NOT NULL,  -- Formato ISO8601 con milisegundos: '2024-02-26T18:30:45.123Z'
    updated_at TEXT NOT NULL,
    deleted_at TEXT,

    -- Auditoría del servidor (actualizados durante la sincronización)
    server_created_at TEXT,
    server_updated_at TEXT,
    server_deleted_at TEXT,

    -- Bandera para detectar cambios locales rápidamente
    is_dirty BOOLEAN NOT NULL DEFAULT 0
);

-- Índices para optimizar consultas frecuentes
CREATE INDEX idx_espacios_sync ON espacio (sync_status);
CREATE INDEX idx_espacios_dirty ON espacio (is_dirty);
''';

  /*'''
    CREATE TABLE $espacioTable (
      $userId TEXT PRIMARY KEY,
      $userName TEXT NOT NULL,
      $userEmail TEXT NOT NULL
    )
  '''*/
}
