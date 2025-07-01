import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      
        appBar: AppBar(title: const Text('Bienvenido')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center column vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center column horizontally
            children: [
              Text('Ingresar'),
              const SizedBox(height: 20), // Add spacing
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/login");
                },
                child: const Text('Continuar'),
              ),
              const SizedBox(height: 10), // Add spacing between button

            ],
          ),
        ),
      
    );
  }
}
