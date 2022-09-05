class Hewan {
  int beratSapi = 70;
}

class Mobil {
  var h1 = Hewan();
  int kapasitas = 1000;
  List<int> muatan = [];

  void tambahMuatan() {
    if (h1.beratSapi <= kapasitas) {
      muatan.add(h1.beratSapi);
    }
  }
}

void main() {
  var result = Mobil();

  result.tambahMuatan();

  print('Kapasitas Muatan = ${result.kapasitas}');
  print('Isi Muatan = ${result.muatan}');
}
