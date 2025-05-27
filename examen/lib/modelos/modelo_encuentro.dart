class EncuentroVial {
  final double kmA;
  final double kmB;
  final double puntoEncuentro;

  EncuentroVial({
    required this.kmA,
    required this.kmB,
    required this.puntoEncuentro,
  });

  // Método para calcular el punto de encuentro
  static double calcularPuntoEncuentro(double kmA, double kmB) {
    return (kmA + kmB) / 2;
  }
}