import 'package:kalkulator/kalkulator.dart';
import 'package:test/test.dart';

void main() {
  group('Kalkulator Tests', () {
    final kal = Kalkulator();

    test('tambah() seharusnya menjumlahkan dua angka', () {
      expect(kal.tambah(10, 5), 15);
      expect(kal.tambah(-5, 5), 0);
    });

    test('kurang() seharusnya mengurangkan dua angka', () {
      expect(kal.kurang(10, 5), 5);
      expect(kal.kurang(-5, 5), -10);
    });

    test('kali() seharusnya mengalikan dua angka', () {
      expect(kal.kali(10, 5), 50);
      expect(kal.kali(-5, 5), -25);
    });

    test('bagi() seharusnya membagi dua angka', () {
      expect(kal.bagi(10, 5), 2);
      expect(kal.bagi(-10, 2), -5);
    });

    test('bagi() seharusnya melempar Exception jika dibagi nol', () {
      expect(() => kal.bagi(10, 0), throwsException);
    });
  });
}
