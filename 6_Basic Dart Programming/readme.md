# RESUME SECTION 6 BASIC DART PROGRAMMING

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary
BASIC DART PROGRAMMING

### Dart <br>
Dart adalah Bahasa Pemrograman yang dirancang untuk membuat aplikasi agar dapat berjalan dengan cepat, Aplikasi yang dibuat dengan Dart dapat berjalan disisi client (frontend) contoh :

- Web (Javascript)
- Dekstop (Dart)
- Mobile (Dart)

Kelebihan Dart 
- Type Safe "Menjamin konsistens tipe data" 
- Null Safety "Memberikan keamanan dari data bernilai hampa (null)"
- Rich Standard Library "Hadir dengan banyak dukungan library internal"
- Multiplatform "Mampu berjalan pada berbagai jenis perangkat"

### DASAR PEMROGRAMAN DART

#### 1. Main
- Bagian yang dijalankan pertama kali
- Tipe data void atau int
- Memiliki nama main <br>

Perintah Print : <br>
```cs
void main() {
  print("Hello World!");
}
```

#### 2. Komentar 
- Memeberi cacatan pada code
- Mencegah perintah dijalan kan <br>

Perintah Komentar 1: <br>
```cs
void main() {
  // ini komentar  
  print("Hello World!");
}
```

Perintah Komentar 2: <br>
```cs
void main() {
  /* 
  ini komentar
  */  
  print("Hello World!");
}
```

#### 3. Variabel
- Untuk menyimpan data
- memiliki nama
- memiliki tipe data

Deklarasi Variabel : <br>
Menggunakan var dan diikuti nama variabel secara otomatis tipe data variabel akan bernilai null,
Menggunakan tanda " = " untuk memberi nilai pada variabel.
```cs
void main() {
  var tahun;
  tahun = 2022;
}
```

Insiasi Variabel : <br>
Deklarasi dan memberi nilai variabel secara bersamaan
```cs
void main() {
  var tahun = 2022;  
}
```

Konstanta : <br>
Menggunakan final, diikuti nama, dan diberikan nilai (nilai tidak bisa diubah "nilai tetap")
```cs
void main() {
  final tahun = 2022;  
}
```

#### 4. Tipe Data
- Jenis data yang dapat dikelola
- Tipe data sederhana disebut primitive data type <br>

Jenis Tipe Data
- int (bilangan bulat)
```cs
void main() {
  int umur = 20;  
}
```
- double (bilangan pecahan "decimal")
```cs
void main() {
  double tinggi = 10.5;  
}
```
- bool (true/false)
```cs
void main() {
  bool wanita = false;  
}
```
- String (text)
```cs
void main() {
  String nama = 'Nico';  
}
```

#### 5. Operator
- Digunakan untuk operasi pengolahan data
- Data yang diolah disebut operand <br>

Aritmatika ( + , - , * , / , % )
```cs
void main() {
  print(1 + 1); // Penjumlahan
  print(1 - 1); // Pengurangan
  print(1 * 1); // Perkalian
  print(1 / 1); // Pembagian
  print(1 % 1); // Sisa Bagi
}
```

Assignment ( = , += , -= , *= , /= , %= )
```cs
void main() {
  var usia = 24.0;
  usia = 23;
  print(usia += 2);
  print(usia -= 2);
  print(usia %= 2);
  print(usia /= 2);
  print(usia *= 2);
}
```

Comparison ( == , < , > , <= , >= )
```cs
void main() {
  print(1 == 2);
  print(1 <= 2);
  print(1 <  2);
  print(1 >= 2);
  print(1 >  2);
}
```

Logical ( && , || , ! )
```cs
void main() {
  print(1 == 2 || 2 == 2);
  print(2 == 2 || 2 == 2);
  print(1 == 2 || 1 == 2);
  print("===============");
  print(1 == 2 && 2 == 2);
  print(2 == 2 && 2 == 2);
  print(1 == 2 && 1 == 2);
  print("===============");

  bool notTrue = !true; 
  print(notTrue);
}
```