import '../modelos/modelo_encuentro.dart';

class ControladorEncuentro {
  static EncuentroVial calcularEncuentro(double kmA, double kmB) {
    double punto = EncuentroVial.calcularPuntoEncuentro(kmA, kmB);
    return EncuentroVial(
      kmA: kmA,
      kmB: kmB,
      puntoEncuentro: punto,
    );
  }
}