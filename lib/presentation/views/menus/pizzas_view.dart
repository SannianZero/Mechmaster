import 'package:flutter/material.dart';

class PizzasView extends StatelessWidget {
  const PizzasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🍕 Pizzas Artesanales'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade900, Colors.pink.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              '🔥 ¡Pizzas artesanales al puro estilo del rock! 🔥',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(color: Colors.white70),
            const SizedBox(height: 16),

            // 🍕 Variedades
            _buildSectionTitle('🍕 Variedades'),
            _buildItem('Margarita', 'Queso mozzarella, tomate fresco y albahaca'),
            _buildItem('Peperoni', 'Clásica con extra sabor rockero'),
            _buildItem('Salami', 'Rebelde, intensa y sabrosa'),
            _buildItem('Champiñones', 'Sencilla y natural, ideal para los más alternativos'),
            _buildItem('Vegetariana', 'Champiñones, pimientos, cebolla, choclo'),
            _buildItem('Hawaiana', 'Jamón + Piña: el dúo polémico, pero amado por muchos'),
            _buildItem('Extra Queso', 'Pura potencia de queso derretido'),
            _buildItem('Tres Quesos', 'Mozzarella, cheddar y parmesano – para paladares sin miedo'),

            const SizedBox(height: 24),
            const Divider(color: Colors.white70),

            // 🧱 Tamaños y precios
            _buildSectionTitle('🧱 Tamaños y precios'),
            _buildItem('🧀 Mediana Rock', '35 cm / 10 porciones – \$9.00'),
            _buildItem('🎸 Grande Power', '40 cm / 12 porciones – \$12.50'),
            _buildItem('🤘 Gigante Monster', '46 cm / 16 porciones – \$15.00'),

            const SizedBox(height: 24),
            const Divider(color: Colors.white70),

            // ➕ Ingredientes extra
            _buildSectionTitle('➕ Ingredientes extra'),
            const Text(
              'Agrega lo que quieras por solo \$1.00 cada uno:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text('Salami')),
                Chip(label: Text('Peperoni')),
                Chip(label: Text('Jamón')),
                Chip(label: Text('Champiñones')),
                Chip(label: Text('Piña')),
                Chip(label: Text('Choclo')),
                Chip(label: Text('Pimientos')),
                Chip(label: Text('Salsa BBQ')),
                Chip(label: Text('Queso extra')),
                Chip(label: Text('Cebolla')),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
