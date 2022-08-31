void main() {
  double pertama = 10;
  double kedua = 20;
  double ketiga = 30;

  double result1 = faktorial(pertama);
  double result2 = faktorial(kedua);
  double result3 = faktorial(ketiga);

  print('Faktorial  $pertama = $result1');
  print('Faktorial  $kedua = $result2');
  print('Faktorial  $ketiga = $result3');
}

double faktorial(double n) {
  return n == 1 ? 1 : n * faktorial(n - 1);
}

// import 'dart:io';

// void main() {
//   int faktorial = 1;
//   print("Masukkan bilangan bulat : ");
//   int? n = int.parse(stdin.readLineSync()!);
//   if (n < 0) {
//     print("Angka yang dimasukkan bukan bilangan bulat");
//   } else {
//     for (int i = 1; i <= n; i++) {
//       faktorial *= i;
//     }
//     print("Hasil faktorial dari " +
//         n.toString() +
//         " adalah " +
//         faktorial.toString());
//   }
// }
