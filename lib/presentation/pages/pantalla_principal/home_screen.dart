import 'package:flutter/material.dart';
import 'package:punto_venta/presentation/pages/comandas/seleccion_mesa_screen.dart';
import 'package:punto_venta/presentation/pages/pantalla_principal/menu_lateral.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    Center(child: Text('Informes')),
    Center(child: Text('Hoy')),
    CajaScreen(),
    Center(child: Text('Artículos')),
    Center(child: Text('Más')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Informes',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Hoy'),
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale),
            label: 'Caja',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Artículos'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Más'),
        ],
      ),
    );
  }
}

class CajaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CERVECERIA MAESTRA Y Ta...'),
        actions: [
          IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
          IconButton(icon: Icon(Icons.phone), onPressed: () {}),
        ],
      ),
      drawer: MenuLateral(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Quiero vender...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.qr_code),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Card(
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeleccionMesaScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                            SizedBox(height: 10),
                            Text('NUEVO ORDEN', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Total de pedidos de mesa: 0',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
