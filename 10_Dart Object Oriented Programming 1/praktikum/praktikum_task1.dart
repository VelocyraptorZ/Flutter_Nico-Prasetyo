class Hewan {
  int berat = 10;
}

class Mobil {
  int kapasitas = 100;
  List<String> muatan = ['Sapi', 'Kambing'];

  void tambahMuatan(int berat, int kapasitas) {
    if (berat <= kapasitas) {
      print('masukan muatan');
    }
  }
}

void main(List<String> args) {
  var h1 = Hewan();
  var h2 = Mobil();

  print(h1);
  print(h2);
}
