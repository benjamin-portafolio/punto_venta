import 'package:flutter/material.dart';
import 'package:punto_venta/data/local/dao/espacio_dao.dart';
import 'package:punto_venta/data/local/db_helper.dart';
import 'package:punto_venta/data/models/espacio_model.dart';
import 'package:punto_venta/data/models/synchronization/synchronization_response.dart';

class PruebasScreen extends StatelessWidget {
  final SynchronizationResponse synchronizationResponse;
  PruebasScreen({super.key, required this.synchronizationResponse});
  EspacioDao espacioDao = EspacioDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pruebas'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pantalla de pruebas, ${synchronizationResponse.espacioResponse?.first.nombre} espacios',
            ),
            ElevatedButton(
              onPressed: () async {
                // Aquí puedes agregar la lógica que necesites para el botón
                print('Botón de pruebas presionado');
                espacioDao
                    .bulkSyncEspacios(
                      (synchronizationResponse.espacioResponse ?? []),
                      await DBHelper.database,
                    )
                    .then((value) {
                      print('Espacios sincronizados: ');
                    })
                    .catchError((error) {
                      print('Error al sincronizar espacios: $error');
                    });
              },
              child: const Text('Ejecutar prueba'),
            ),
          ],
        ),
      ),
    );
  }
}
