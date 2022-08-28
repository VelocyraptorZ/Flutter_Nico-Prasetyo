# RESUME SECTION 5 Introduction to Algorithm and Dart Programming

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary
Introduction to Algorithm and Dart Programming

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