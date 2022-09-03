// void main() async {
//   List data = [10, 20, 30, 40, 50];
//   List pengali = [1, 2, 3, 4, 5];
//   List hasil = [];

//   List hasilkali = kali(data, pengali, hasil);

//   for (int i = 0; i < 5; i += 1) {
//     print('Hasil ${(data[i])} x ${(pengali[i])} = ${(hasilkali[i])}');
//   }
// }

// List kali(List data, List pengali, List hasil) {
//   for (int i = 0; i < data.length; i++) {
//     hasil.add(data[i] * pengali[i]);
//   }
//   return hasil;
// }

void main() async {
  List data = [10, 20, 30, 40, 50];
  int pengali = 10;
  List hasil = [];

  List hasilkali = kali(data, pengali, hasil);

  print(data);

  await Future.delayed(Duration(seconds: 2), () {
    for (int i = 0; i < 5; i += 1) {
      print('Hasil ${(data[i])} x $pengali = ${(hasilkali[i])}');
    }
  });
}

List kali(List data, int pengali, List hasil) {
  for (int i = 0; i < data.length; i++) {
    hasil.add(data[i] * pengali);
  }
  return hasil;
}
