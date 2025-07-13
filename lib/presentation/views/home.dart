import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../../bloc/services/location_service.dart'; // Asegúrate que esta ruta es correcta

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String destination = '';
  LatLng? userLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final pos = await LocationService.getCurrentLocation();
      setState(() {
        userLocation = LatLng(pos.latitude, pos.longitude);
      });
    } catch (e) {
      Get.snackbar(
        'Error de ubicación',
        e.toString(),
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.red.shade900;
    final accentColor = Colors.pink.shade400;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text(
                'Mi Cuenta',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.white),
              title: Text('Historial de viajes', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.support_agent, color: Colors.white),
              title: Text('Soporte', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Configuraciones', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('¿A dónde vas?', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, accentColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 32, 16, 16),
        child: Column(
          children: [
            // Ubicación actual
            _locationBox(
              icon: Icons.my_location,
              label: userLocation != null
                  ? 'Lat: ${userLocation!.latitude.toStringAsFixed(5)}, Lng: ${userLocation!.longitude.toStringAsFixed(5)}'
                  : 'Ubicación actual no disponible',
              iconColor: Colors.white,
            ),
            const SizedBox(height: 12),
            // Campo de destino (manual)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '¿A dónde vas?',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      onChanged: (value) {
                        destination = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Opciones de vehículo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _vehicleOption(Icons.directions_car, "Económico"),
                _vehicleOption(Icons.car_rental, "Premium"),
                _vehicleOption(Icons.two_wheeler, "Moto"),
              ],
            ),
            const Spacer(),
            // Buscar conductor (simulado)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (destination.trim().isEmpty) {
                    Get.snackbar(
                      'Destino requerido',
                      'Por favor ingresa un destino.',
                      backgroundColor: Colors.red.shade300,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  Get.defaultDialog(
                    title: "Buscando conductor...",
                    content: const Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                    barrierDismissible: false,
                  );

                  Future.delayed(const Duration(seconds: 3), () {
                    Get.back(); // Cierra el diálogo
                    Get.snackbar(
                      "¡Conductor encontrado!",
                      "Tu conductor llegará pronto",
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Buscar conductor", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade600,
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.gps_fixed, color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _locationBox({required IconData icon, required String label, required Color iconColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _vehicleOption(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white.withOpacity(0.2),
          child: Icon(icon, size: 28, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

// Para simular coordenadas (si quieres usar en otras partes)
class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}