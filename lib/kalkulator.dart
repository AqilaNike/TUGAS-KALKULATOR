// lib/kalkulator.dart

class Kalkulator {
  // Operasi Pertambahan
  double tambah(double a, double b) => a + b;

  // Operasi Pengurangan
  double kurang(double a, double b) => a - b;

  // Operasi Perkalian
  double kali(double a, double b) => a * b;

  // Operasi Pembagian dengan validasi angka nol
  double bagi(double a, double b) {
    if (b == 0) {
      // Melempar error jika pembagi adalah angka 0
      throw Exception("Pembagian dengan angka nol tidak diperbolehkan.");
    }
    return a / b;
  }
}
