# RESUME SECTION 9 Collection

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary
Collection.

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

#### Collection
Kumpulan data pada satu tempat

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