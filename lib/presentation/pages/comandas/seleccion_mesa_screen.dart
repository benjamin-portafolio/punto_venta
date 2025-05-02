import 'package:flutter/material.dart';
import 'package:punto_venta/data/local/dao/espacio_dao.dart';
import 'package:punto_venta/data/local/db_helper.dart';
import 'package:punto_venta/data/models/espacio_model.dart';
import 'package:punto_venta/data/models/synchronization/synchronization_response.dart';
import 'package:punto_venta/data/remote/synchronization/synchronization_api_service.dart';
import 'package:punto_venta/presentation/pages/alta_espacios/alta_espacios_screen.dart';
import 'package:punto_venta/presentation/pages/pruebas_screen.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SeleccionMesaScreen extends StatefulWidget {
  const SeleccionMesaScreen({super.key});

  @override
  State<SeleccionMesaScreen> createState() => _SeleccionMesaScreenState();
}

class _SeleccionMesaScreenState extends State<SeleccionMesaScreen> {
  List<Espacio> espacios = [];
  SynchronizationResponse? synchronizationResponse;
  final SynchronizationApiService synchronizationApiService =
      SynchronizationApiService();

  Future<void> cargarEspacios() async {
    EspacioDao espacioDao = EspacioDao();
    List<Espacio> listaEspacios = await espacioDao.obtenerEspacios(
      await DBHelper.database,
    );

    setState(() {
      espacios = listaEspacios;
    });

    // print("ejemplo de primer espacio: ${espacios[0].nombre}");
  }

  @override
  void initState() {
    super.initState();
    cargarEspacios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SELECCIONAR MESA'), centerTitle: true),
      body: Column(
        children: [
          IconButton(
            onPressed: () async {
              synchronizationResponse =
                  await synchronizationApiService.fetchSynchronizationInfo();
              if (synchronizationResponse != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PruebasScreen(
                          synchronizationResponse: synchronizationResponse!,
                        ),
                  ),
                );
                print(
                  '*******test boton************'
                  ' synchronizationResponse: ${synchronizationResponse!.espacioResponse?[1].nombre}',
                );
              }
            },
            icon: const Icon(Icons.security_update_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AltaEspaciosScreen()),
              );
              print('*******test boton************');
            },
            icon: const Icon(Icons.restaurant),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                FilterChip(
                  label: const Text('TODO'),
                  selected: true,
                  onSelected: (bool value) {},
                ),
                SizedBox(width: 8),
                ...espacios.map((espacio) {
                  return FilterChip(
                    label: Text(espacio.nombre),
                    selected: false,
                    onSelected: (bool selected) {
                      /*setState(() {
                          if (selected) {
                            selectedUsuarios.add(usuario);
                          } else {
                            selectedUsuarios.remove(usuario);
                          }
                        });*/
                    },
                    //   avatar: CircleAvatar(child: Text(usuario.nombre[0])),
                  );
                }),
              ],
            ),
          ),

          /*Wrap(
            spacing: 8.0,
            children: [
              FilterChip(
                label: const Text('TODO'),
                selected: true,
                onSelected: (bool value) {},
              ),
              ...espacios.map((espacio) {
                return FilterChip(
                  label: Text(espacio.nombre),
                  // selected: selectedUsuarios.contains(usuario),
                  onSelected: (bool selected) {
                    /*setState(() {
                          if (selected) {
                            selectedUsuarios.add(usuario);
                          } else {
                            selectedUsuarios.remove(usuario);
                          }
                        });*/
                  },
                  //   avatar: CircleAvatar(child: Text(usuario.nombre[0])),
                );
              }),
            ],
          ),*/
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Mesa ${index + 1}'),
                  subtitle: Text('Estado: Libre'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de detalles de la mesa
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
