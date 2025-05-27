import 'package:flutter/material.dart';

class VistaInicio extends StatelessWidget {
  const VistaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/encuentro'); // Navegación por nombre de ruta
          },
          child: const Text('Ir a Punto Encuentro Vial'),
        ),
      ),
    );
  }
}