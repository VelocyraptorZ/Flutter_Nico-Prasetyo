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

#### Fungsi (Lanjutan)

Anonymous Function
- Tidak memiliki nama
- Fungsi sebagai data

```cs
var hello = () {
  print('Hello World!');
};

var jumlah = (int a, int b) {
  return a + b;
};

void main() {
  hello();
  print(jumlah(1, 2));
}
```

Arrow Function
- Dapat memiliki nama atau tidak
- Berisi 1 data (dari proses maupun data statis)
- Nilai return fungsi ini diambil dari data tersebut

```cs
var hello = () => print('Hello World!'); // Fungsi hello melakukan print didalamnya

var jumlah = (int a, int b) => a + b; // Fungsi jumlah memberi nilai saat dijalankan sehingga dapat dilakukan print

void main() {
  hello();
  print(jumlah(1, 2));
}
```

Async-Await
- Menjalankan beberapa proses tanpa perlu menunggu
- Proses ditulis dalam bentuk fungsi
- Await akan menunggu hingga proses async selesai

Simulasi tanpa await :
```cs
void P1() {
  Future.delayed(Duration(seconds: 1), () {
    print('Hello World P1!');
  });
}

void P2() {
  print('Hello World P2');
}

void main() {
  P1();
  P2();
}
```
Simulasi dengan await :
```cs
Future<void> P1() async {
  await Future.delayed(Duration(seconds: 1), () {
    print('Hello World P1!');
  });
}

void P2() {
  print('Hello World P2');
}

void main() async {
  await P1();
  P2();
}
```

#### Tipe Data Future
- Data yang dapat ditunggu
- Membawa data return dari fungsi async 

```cs
Future<String> P1() async {
  return Future.delayed(Duration(seconds: 1), () {
    return 'Hello World P1!';
  });
}

void main() async {
  var data = await P1();
  print(data);
}
```

#### List 
- Menyimpan data secara berbaris
- Tiap data memiliki index

```cs
void main() async {
  var scores = [];
  scores.add(60);
  scores.add(70);
  scores.add(80);
  scores.add(90);
  scores.add(65);
  scores.add(75);
  print(scores);

  print(scores[0]);
  print(scores[1]);
  print(scores[2]);
  print(scores[3]);
  print(scores[4]);
}
```

#### Map
- Menyimpan data secara key-value 
- Key berguna selayaknya index pada list 

```cs
void main() {
  var student = {};
  student['name'] = 'Nico';
  student['age'] = '22';
  print(student);

  print(student['name']);
  print(student['age']);
}
```