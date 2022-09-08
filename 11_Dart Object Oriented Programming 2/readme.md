# RESUME SECTION 11 Dart Object Oriented Programming 2

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Dart Object Oriented Programming 2

### Constructor
- Method yang dijalankan saat pembuatan object
- Dapat Menerima Parameter
- Tidak memiliki return
- Nama sama dengan nama class

```cs
//Memberi Constructor
class Hewan {
    var mata;
    var kaki;

    Hewan() {
        mata = 0;
        kaki = 0;
    }
}
```

### Inheritance
- Membuat class baru dengan memanfaatkan class yang sudah ada
- Bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru

```cs
//Melakukan Inheritance
class Kambing extends Hewan {
    Kambing() {
        mata = 0;
        kaki = 0;
    }
}

//Penggunaan Class
void main() {
    var k1 = Kambing();
    print(k1.mata);
}
```

### Method Overriding
- Menulis ulang method yang ada pada super class
- Bertujuan agar class memiliki method yang sama, dengan proses yang berbeda
#### Melakukan Overriding
- Dilakukan pada class yang melakukan inheritance 
- Method sudah ada pada class induk  
- Method ditulis ulang seperti membuat method baru pada class anak
- Ditambahkan tanda @override dibaris sebelum method dibuat

```cs
class Hewan {
    reproduksi() {
        print('Tidak Diketahui');
    }

    bernapas() {
        print('Tidak Diketahui');
    }
}

class Kambing extends Hewan {
    @override
    reproduksi() {
        print('Melahirkan');
    }

    @override
    bernapas() {
        print('Paru - paru');
    }
}

//Penggunaan Class
void main() {
    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas();
}
```

### Interface
- Berupa class
- Menunjukkan method apa saja yang ada pada suatu class 
- Seluruh method wajib di-override
- Digunakan dengan menggunakan implements 
####
- Sekilas mirip inheritance
- Pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class induk

```cs
//Menggunakan Interface
class Hewan {
    reproduksi() {
        print('Tidak Diketahui');
    }

    bernapas() {
        print('Tidak Diketahui');
    }
}

class Kambing implements Hewan {
    @override
    reproduksi() {
        print('Melahirkan');
    }

    @override
    bernapas() {
        print('Paru - paru');
    }
}

//Penggunaan Class
void main() {
    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas();
}
```

### Abstract Class
- Berupa class abstrak
- Menunjukan method apa saja yang ada pada suatu class
- Digunakan dengan menggunakan extends
- Tidak dapat dibuat object
- Tidak semua method harus di-override

```cs
//Menggunakan Abstract Class
abstract class Hewan {
    reproduksi() {
        print('Tidak Diketahui');
    }

    bernapas() {
        print('Tidak Diketahui');
    }
}

class Kambing extends Hewan {
    @override
    reproduksi() {
        print('Melahirkan');
    }
}

//Penggunaan Class
void main() {
    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();
}
```

### Polymorphism
- Kemampuan data berubah menjadi bentuk lain
- Tipe data yang dapat digunakan adalah super class 
- Dapat dilakukan pada class dengan extends atau implements

```cs
//Melakukan Polymorphism
void main() {
    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();
}
```

### Generics
- Dapat digunakan pada class atau fungsi
- Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda
- Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi

#### Membuat Class dengan Generics
- Class Hadiah dapat dimasukkan data dengan tipe T
- Tipe T dapat digunakan diseluruh class Hadiah

```cs
class Hadiah<T> {
    var isi;

    Hadiah(T i) {
        isi = i;
    }
}
```

#### Menggunakan Class dengan Generics
- Setelah nama class, menjadi tempat tipe data yang diinginkan

```cs
void main() {
    var h1 = Hadiah<String>('mobil');
    print(h1.isi);

    var h2 = Hadiah<int>(10);
    print(h2.isi);
}
```

#### Membuat Fungsi dengan Generics
- Setelah nama fungsi, menjadi tempat variabel generics

```cs
void cekTipe<T>(T data) {
    print(data.runtimeType);
}
```

#### Menggunakan Fungsi dengan Generics
- Setelah nama fungsi, menjadi tempat tipe data yang diinginkan

```cs
void main() {
    cekTipe<String>("satu");
    cekTipe<int>(1);
}
```