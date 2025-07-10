import 'package:flutter/material.dart';
import 'package:get/get.dart';

// controllers
import '../../bloc/controlers/auth_controller.dart';
import 'menus/hamburguesas_view.dart'; // Asegúrate de que esta ruta sea correcta
import 'menus/pizzas_view.dart';
class HomeView extends StatelessWidget {
  HomeView({super.key});
  final AuthController authController = Get.put(AuthController());

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Hamburguesas',
      'icon': Icons.fastfood,
      'route': () => HamburguesasView(),
    },
    {
  'title': 'Pizzas',
  'icon': Icons.local_pizza,
  'route': () => const PizzasView(),
    },
    {
      'title': 'Bebidas',
      'icon': Icons.local_drink,
      'route': null,
    },
    {
      'title': 'Postres',
      'icon': Icons.icecream,
      'route': null,
    },
    {
      'title': 'Combos',
      'icon': Icons.lunch_dining,
      'route': null,
    },
    {
      'title': 'Ofertas',
      'icon': Icons.local_offer,
      'route': null,
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
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Bienvenido 🍔',
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Card(
                    color: Colors.white.withOpacity(0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        if (category['route'] != null) {
                          Get.to(category['route']()); // ✅ CORRECTO
                        }
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            category['icon'],
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.red.shade900,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                'Menú Principal',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.white),
              title: const Text('Mis pedidos', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Mi cuenta', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
              onTap: () {
                authController.logout();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade600,
        onPressed: () {
          // Acción para carrito o navegación futura
        },
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
