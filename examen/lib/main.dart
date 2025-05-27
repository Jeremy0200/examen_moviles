import 'package:flutter/material.dart';
import 'package:pry_numeros_pares/temas/app_temas.dart';
import 'package:pry_numeros_pares/vistas/vista_inicio.dart';
import 'package:pry_numeros_pares/vistas/encuentro_vial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Punto Encuentro Vial',
      theme: AppTemas.temaPrincipal(),

      // Configuración de rutas
      initialRoute: '/',          // Ruta inicial
      routes: {
        '/': (context) => VistaInicio(),          // Pantalla de inicio
        '/encuentro': (context) => EncuentroVialScreen(), // Pantalla de cálculo
      },
    );
  }
}