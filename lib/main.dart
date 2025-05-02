import 'package:flutter/material.dart';
import 'package:punto_venta/data/local/dao/espacio_dao.dart';
import 'package:punto_venta/data/local/db_helper.dart';
import 'package:punto_venta/data/models/espacio_model.dart';
import 'package:punto_venta/presentation/pages/comandas/seleccion_mesa_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seleccionar Mesa',
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: const TableSelectionScreen(),
      home: const SeleccionMesaScreen(),
    );
  }
}

class TableSelectionScreen extends StatelessWidget {
  const TableSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SELECTIONAR MESA'), centerTitle: true),
      body: Column(
        children: [
          // Filter chips
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                FilterChip(
                  label: const Text('TODr'),
                  selected: true,
                  onSelected: (bool value) async {
                    final db = await DBHelper.database;
                    EspacioDao espacioDao = EspacioDao();
                    List<Espacio> espacios = await espacioDao.obtenerEspacios(
                      db,
                    );
                    print(
                      '****************** prueba de impresion ****************',
                    );
                    print(espacios.first.nombre);
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('JARDÍN'),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('BARRA'),
                  selected: false,
                  onSelected: (bool value) {},
                ),
              ],
            ),
          ),

          // Table list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                TableItem(
                  name: 'MESA - MESA 5',
                  type: 'RECTANGLE (2)',
                  status: 'EMPTY',
                  description: 'Mesa chica',
                ),
                TableItem(
                  name: 'MESA - BASACA 3',
                  type: 'BAR SEAT (1)',
                  status: 'EMPTY',
                ),
                TableItem(
                  name: 'MESA - BASACA 4',
                  type: 'RECTANGLE (6)',
                  status: 'EMPTY',
                  description: 'Mesa grande',
                ),
                TableItem(
                  name: 'MESA - SALA 2',
                  status: 'EMPTY',
                  description: 'Sala mimbre',
                ),
                TableItem(
                  name: 'MESA - MESA 3',
                  type: 'RECTANGLE (6)',
                  status: 'EMPTY',
                  description: 'Mesa mediana',
                ),
                TableItem(
                  name: 'MESA - BASACA 1',
                  type: 'BAR SEAT (1)',
                  status: 'EMPTY',
                ),
                TableItem(
                  name: 'MESA - CLIENTE 1',
                  type: 'OTHER (1)',
                  status: 'EMPTY',
                ),
                TableItem(
                  name: 'MESA - BARRIL',
                  type: 'CIRCLE (3)',
                  status: 'EMPTY',
                ),
                TableItem(name: 'MESA - PERIQUERA', status: 'EMPTY'),
                TableItem(
                  name: 'MESA - MESA 2',
                  status: 'EMPTY',
                  description: 'Mesa chica',
                ),
                TableItem(
                  name: 'MESA - MESA 1',
                  type: 'RECTANGLE (6)',
                  status: 'EMPTY',
                  description: 'Mesa mediana',
                ),
                TableItem(
                  name: 'MESA - CLIENTE 2',
                  type: 'OTHER (1)',
                  status: 'EMPTY',
                ),
                TableItem(
                  name: 'MESA - BASACA 4',
                  type: 'RECTANGLE (1)',
                  status: 'EMPTY',
                ),
                TableItem(
                  name: 'MESA - SALA1',
                  type: 'OTHER (4)',
                  status: 'EMPTY',
                  description: 'Sala grande',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TableItem extends StatelessWidget {
  final String name;
  final String? type;
  final String status;
  final String? description;

  const TableItem({
    super.key,
    required this.name,
    this.type,
    required this.status,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            if (type != null) ...[
              const SizedBox(height: 4),
              Text(type!, style: TextStyle(color: Colors.grey[600])),
            ],
            const SizedBox(height: 8),
            Text(
              status,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (description != null) ...[
              const SizedBox(height: 4),
              Text(
                description!,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
