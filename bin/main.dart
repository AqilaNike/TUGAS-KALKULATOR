// bin/main.dart
import 'dart:io';
import '../lib/kalkulator.dart';

void main() async {
  final kalkulator = Kalkulator();

  print("       APLIKASI KALKULATOR       ");

  while (true) {
    final bil1 = _inputAngka("\nMasukkan bilangan pertama: ");
    final bil2 = _inputAngka("Masukkan bilangan kedua: ");
    final operasi = _pilihOperasi();

    stdout.write("Menghitung...");
    await Future.delayed(const Duration(seconds: 1));
    print("\n------------------------------------------");

    try {
      // Menggunakan Dart 3 switch expression untuk hasil yang lebih bersih
      final hasil = switch (operasi) {
        '1' => kalkulator.tambah(bil1, bil2),
        '2' => kalkulator.kurang(bil1, bil2),
        '3' => kalkulator.kali(bil1, bil2),
        '4' => kalkulator.bagi(bil1, bil2),
        _ => throw FormatException("Pilihan tidak valid"),
      };

      final simbol = switch (operasi) {
        '1' => '+',
        '2' => '-',
        '3' => 'x',
        '4' => '/',
        _ => '?',
      };

      print("Hasil: $bil1 $simbol $bil2 = $hasil");
    } catch (e) {
      print("Terjadi Kesalahan: ${e.toString().replaceAll("Exception: ", "")}");
    }

    print("==========================================");
    if (!_konfirmasiLanjut()) break;
  }

  print("\nTerima kasih telah menggunakan aplikasi kalkulator!");
}

// Memisahkan logika input angka ke dalam fungsi tersendiri (Modular)
double _inputAngka(String pesan) {
  while (true) {
    stdout.write(pesan);
    final input = stdin.readLineSync();
    
    // Menggunakan tryParse yang lebih aman dibanding throw exception
    if (input != null && input.isNotEmpty) {
      final angka = double.tryParse(input);
      if (angka != null) return angka;
    }
    print("Error: Input wajib berupa angka!");
  }
}

// Memisahkan logika pemilihan operasi
String _pilihOperasi() {
  print("\nPilih Operasi Matematika:");
  print(" [1] Tambah (+)");
  print(" [2] Kurang (-)");
  print(" [3] Kali   (x)");
  print(" [4] Bagi   (/)");

  while (true) {
    stdout.write("Masukkan pilihan (1-4): ");
    final pilihan = stdin.readLineSync();
    if (['1', '2', '3', '4'].contains(pilihan)) {
      return pilihan!;
    }
    print("Error: Pilihan tidak valid (Harus angka 1-4).");
  }
}

// Memisahkan logika konfirmasi
bool _konfirmasiLanjut() {
  while (true) {
    stdout.write("Apakah Anda ingin menghitung lagi? (Y/T): ");
    final input = stdin.readLineSync()?.trim().toUpperCase();
    if (input == 'Y') return true;
    if (input == 'T') return false;
    print("Error: Masukan salah! Cukup ketik 'Y' atau 'T'.");
  }
}
