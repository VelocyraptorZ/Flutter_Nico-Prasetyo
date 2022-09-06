class Hewan {
  int beratSapi = 70;
  int beratKambing = 80;
}

class Mobil {
  var h1 = Hewan();
  int kapasitas = 100;
  List muatan = [];
  List<int> beratmuatan = [];

  void tambahMuatan() {
    if (h1.beratSapi < kapasitas) {
      muatan.add('Sapi');
    } else if (h1.beratKambing < kapasitas) {
      muatan.add('Kambing');
    }
  }

  void totalMuatan() {
    if (h1.beratSapi < kapasitas) {
      beratmuatan.add(h1.beratSapi);
    }
  }
}

void main() {
  var result = Mobil();

  result.tambahMuatan();
  result.totalMuatan();

  print('Kapasitas Muatan Maximum = ${result.kapasitas}');
  print('Isi Muatan = ${result.muatan}');
  print('Total Muatan = ${result.beratmuatan}');
}
