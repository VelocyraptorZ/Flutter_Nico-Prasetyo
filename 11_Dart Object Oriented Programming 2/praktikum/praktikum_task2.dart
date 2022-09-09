class matematika {
  int? x;
  int? y;

  int hasil(int x, int y) {
    int i;
    if (x > y) {
      i = x;
      x = y;
      y = i;
    }
    while (x > 0) {
      i = y % x;
      y = x;
      x = i;
    }
    return y;
  }
}

class faktorPersekutuanTerbesar implements matematika {
  faktorPersekutuanTerbesar() {
    x = 16;
    y = 40;
  }

  @override
  int? x;

  @override
  int? y;

  @override
  int hasil(int x, int y) {
    int i;
    if (x > y) {
      i = x;
      x = y;
      y = i;
    }
    while (x > 0) {
      i = y % x;
      y = x;
      x = i;
    }
    return y;
  }
}

class kelipatanPersekutuanKecil implements matematika {
  kelipatanPersekutuanKecil() {
    x = 16;
    y = 40;
  }

  @override
  int? x;

  @override
  int? y;

  @override
  int hasil(int x, int y) {
    int i;

    if (x > y) {
      i = x;
      x = y;
      y = i;
    }
    for (i = y; i % x != 0 || i % y != 0; i++);
    return i;
  }
}

void main() {
  var fpb = faktorPersekutuanTerbesar();
  var kpk = kelipatanPersekutuanKecil();
  var operational = matematika();

  print("Bilangan x = ${fpb.x}");
  print("Bilangan y = ${fpb.y}");
  print(
      "Faktor Pesekutuan Terbesar (${fpb.x},${fpb.y}) = ${operational.hasil(fpb.x!, fpb.y!)}");

  print("=============================");

  print("Bilangan x = ${kpk.x}");
  print("Bilangan y = ${kpk.y}");
  print(
      "Kelipatan Pesekutuan Terkecil (${kpk.x},${kpk.y}) = ${kpk.hasil(kpk.x!, kpk.y!)}");
}
