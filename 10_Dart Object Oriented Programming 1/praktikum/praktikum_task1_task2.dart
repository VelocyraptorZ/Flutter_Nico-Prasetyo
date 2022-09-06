// class Hewan {
//   int beratSapi = 70;
//   int beratKambing = 80;
// }

// class Mobil {
//   var h1 = Hewan();
//   int kapasitas = 100;
//   List muatan = [];
//   List<int> beratmuatan = [];

//   void tambahMuatan() {
//     if (h1.beratSapi < kapasitas) {
//       muatan.add('Sapi');
//       muatan.add('Kambing');
//       beratmuatan.add(h1.beratSapi);
//       beratmuatan.add(h1.beratKambing);
//     }
//   }

//   int totalMuatan() {
//     int total = 0;
//     for (int hitung in beratmuatan) {
//       total += hitung;
//     }
//     return total;
//   }
// }

// void main() {
//   var result = Mobil();

//   result.tambahMuatan();
//   result.totalMuatan();

//   print('Kapasitas Muatan Maximum = ${result.kapasitas}');
//   print('Isi Muatan = ${result.muatan}');
//   print('Total Muatan = ${result.totalMuatan()}');
// }

import 'dart:io';

class Hewan {
  List<int> beratMuatan = [];
}

class Mobil {
  var berat = Hewan();
  int kapasitas = 100;
  List<String> muatan = [];

  int tambahMuatan(int berathewan, String namahewan) {
    if (berathewan <= kapasitas) {
      berat.beratMuatan.add(berathewan);
      muatan.add(namahewan);
      kapasitas -= berathewan;
    } else {
      print('Melebihi Kapasitas');
    }
    return 0;
  }

  int totalMuatan() {
    int total = 0;
    for (int hitung in berat.beratMuatan) {
      total += hitung;
    }
    return total;
  }
}

void main() {
  var result = Mobil();
  bool ulang = true;

  do {
    String jawab = '';

    stdout.write('Masukan Nama Hewan  = ');
    String? namahewan = (stdin.readLineSync()!);

    stdout.write('Masukan Berat Hewan = ');
    int? berathewan = int.parse(stdin.readLineSync()!);
    result.tambahMuatan(berathewan, namahewan);

    print('Daftar Muatan               = ${result.muatan}');
    print('Daftar Berat Muatan         = ${result.berat.beratMuatan}');
    print('Sisa Kapasitas Muatan Mobil = ${result.kapasitas}');
    print('Total Berat Muatan          = ${result.totalMuatan()}');

    do {
      stdout.write('Isi Data Muatan Lagi (y/n) ? ');
      jawab = stdin.readLineSync()!;

      if (jawab == 'n') {
        exit(0);
      } else if (jawab != 'y') {
        print('Error Input');
      }
    } while (jawab != 'y');
  } while (ulang == true);
}
