import 'package:flutter/material.dart';
import 'package:punto_venta/data/local/dao/espacio_dao.dart';
import 'package:punto_venta/data/local/db_helper.dart';
import 'package:punto_venta/data/models/espacio_model.dart';

class AltaEspaciosScreen extends StatefulWidget {
  @override
  State<AltaEspaciosScreen> createState() => _AltaEspaciosScreenState();
}

class _AltaEspaciosScreenState extends State<AltaEspaciosScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  EspacioDao espacioDao = EspacioDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alta Espacios'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Nombre del espacio',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Procesar datos
                    print('Nombre del espacio: ${_controller.text}');
                    espacioDao
                        .insertOrUpdateEspacio(
                          Espacio(nombre: _controller.text),
                          await DBHelper.database,
                        )
                        .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Espacio guardado')),
                          );
                          _controller.clear();
                        })
                        .catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $error')),
                          );
                        });
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es obligatorio';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Procesar datos
              }
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }*/
}
