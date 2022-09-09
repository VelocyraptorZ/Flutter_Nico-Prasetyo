class bangunRuang {
  int? sisi1;
  int? sisi2;
  int? sisi3;
  int? panjang;
  int? lebar;
  int? tinggi;

  int volume(int panjang, int lebar, int tinggi) {
    return (panjang * lebar * tinggi);
  }
}

class kubus extends bangunRuang {
  kubus() {
    sisi1 = 2;
    sisi2 = 2;
    sisi3 = 2;
  }

  @override
  int volume(int sisi1, int sisi2, sisi3) {
    return (sisi1 * sisi2 * sisi3);
  }
}

class balok extends bangunRuang {
  balok() {
    panjang = 10;
    lebar = 2;
    tinggi = 5;
  }
}

void main() {
  var b1 = balok();
  var k1 = kubus();
  var r1 = bangunRuang();
  r1.volume;

  print("Sisi Kubus = ${k1.sisi1}");
  print("Volume Kubus = ${k1.volume(k1.sisi1!, k1.sisi2!, k1.sisi3!)}");

  print("=============================");

  print("Panjang Balok = ${b1.panjang}");
  print("Lebar Balok   = ${b1.lebar}");
  print("Tinggi Balok  = ${b1.tinggi}");
  print("Volume Balok  = ${r1.volume(b1.panjang!, b1.lebar!, b1.tinggi!)}");
}
