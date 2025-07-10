import 'package:flutter/material.dart';

class HamburguesasView extends StatelessWidget {
  HamburguesasView({super.key});

  final List<Map<String, dynamic>> hamburguesas = [
    {
      'nombre': 'Papi Carne',
      'precio': 1.75,
      'descripcion': 'Hamburguesa simple con carne jugosa',
    },
    {
      'nombre': 'Bloodemoon Burger',
      'precio': 5.25,
      'descripcion':
          'Doble carne, pan rojo, 3 quesos derretidos, cebolla caramelizada, jamón, lechuga',
    },
    {
      'nombre': 'SalchipapaO (Doble Completa)',
      'precio': 3.25,
      'descripcion': 'Doble carne, pollo y carne molida',
    },
    {
      'nombre': 'Choripapa',
      'precio': 2.00,
      'descripcion': 'Hamburguesa con chorizo y papas fritas',
    },
    {
      'nombre': 'Hamburguesa Hawaiana',
      'precio': 3.50,
      'descripcion': 'Hamburguesa simple con jamón, piña y papas',
    },
    {
      'nombre': 'Hamburguesa Simple',
      'precio': 2.50,
      'descripcion': 'Carne 100 g',
    },
    {
      'nombre': 'Hamburguesa Doble',
      'precio': 3.50,
      'descripcion': 'Carne 200 g',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade900, Colors.pink.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'Hamburguesas 🍔',
                  style: TextStyle(color: Colors.white),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: hamburguesas.length,
                  itemBuilder: (context, index) {
                    final item = hamburguesas[index];
                    return Card(
                      color: Colors.white.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          item['nombre'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          item['descripcion'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        trailing: Text(
                          '\$${item['precio'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Puedes agregar una vista detallada o acción aquí
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
