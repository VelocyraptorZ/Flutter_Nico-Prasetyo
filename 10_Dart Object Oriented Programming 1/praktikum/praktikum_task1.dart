class Hewan {
  int beratSapi = 70;
  int beratKambing = 80;
}

class Mobil {
  var h1 = Hewan();
  int kapasitas = 1000;
  List<int> muatan = [];

  void tambahMuatan() {
    if (h1.beratSapi <= kapasitas) {
      muatan.add(h1.beratSapi);
    } else if (h1.beratKambing <= kapasitas) {
      muatan.add(h1.beratKambing);
    } else {
      muatan.add(0);
    }
  }
}

void main() {
  var result = Mobil();

  result.tambahMuatan();

  print('Kapasitas Muatan = ${result.kapasitas}');
  print('Isi Muatan = ${result.muatan}');
}
