import 'package:flutter/material.dart';
import 'package:punto_venta/data/models/synchronization/synchronization_response.dart';

class PruebasScreen extends StatelessWidget {
  final SynchronizationResponse synchronizationResponse;
  const PruebasScreen({super.key, required this.synchronizationResponse});

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
              onPressed: () {
                // Aquí puedes agregar la lógica que necesites para el botón
                print('Botón de pruebas presionado');
              },
              child: const Text('Ejecutar prueba'),
            ),
          ],
        ),
      ),
    );
  }
}
