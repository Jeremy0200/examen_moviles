import 'package:flutter/material.dart';
import '../controladores/controlador_encuentro.dart';
import '../modelos/modelo_encuentro.dart';
import '../temas/app_temas.dart';

class EncuentroVialScreen extends StatefulWidget {
  @override
  _EncuentroVialScreenState createState() => _EncuentroVialScreenState();
}

class _EncuentroVialScreenState extends State<EncuentroVialScreen> {
  final TextEditingController _kmAController = TextEditingController();
  final TextEditingController _kmBController = TextEditingController();
  late EncuentroVial _datosEncuentro;
  bool _mostrarResultado = false;

  @override
  void initState() {
    super.initState();
    _datosEncuentro = EncuentroVial(kmA: 0, kmB: 0, puntoEncuentro: 0);
  }

  void _calcular() {
    final double kmA = double.tryParse(_kmAController.text) ?? 0;
    final double kmB = double.tryParse(_kmBController.text) ?? 0;

    setState(() {
      _datosEncuentro = ControladorEncuentro.calcularEncuentro(kmA, kmB);
      _mostrarResultado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Punto Encuentro Vial')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Campos para ingresar distancias
            TextField(
              controller: _kmAController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kilómetro Vehículo A (hacia Zacatecas)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _kmBController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kilómetro Vehículo B (hacia Aguascalientes)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              style: AppTemas.botonPrimario(),
              child: const Text('Calcular Punto de Encuentro'),
            ),
            SizedBox(height: 20),

            // Resultado (solo visible después de calcular)
            if (_mostrarResultado)
              Column(
                children: [
                  Text(
                    'Vehículo A: Km ${_datosEncuentro.kmA} → Zacatecas',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Vehículo B: Km ${_datosEncuentro.kmB} → Aguascalientes',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Punto de encuentro: ${_datosEncuentro.puntoEncuentro.toStringAsFixed(1)} km',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _kmAController.dispose();
    _kmBController.dispose();
    super.dispose();
  }
}