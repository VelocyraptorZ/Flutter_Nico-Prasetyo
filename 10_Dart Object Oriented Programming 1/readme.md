# RESUME SECTION 10 Dart Object Oriented Programming 1

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Dart Object Oriented Programming 1

### Object Oriented Programming
- Biasa Disebut OOP
Komponen OOP =  Class, Object, Property, Method, Inheritance, Generics
- Program disusun dalam abstraksi object
- Data dan proses diletakkan pada abstraksi tersebut

### Class
- Abstraksi dari sebuah benda (Object)
- Memiliki ciri - ciri yang disebut property
- Memiliki sifat dan kemampuan yang disebut method

```cs
class Hewan {} // class

void main() { // object
  var h1 = Hewan(); 
  var h2 = Hewan();
  var h3 = Hewan();

  print(h1);
  print(h2);
  print(h3);
}
```
### Property
- Ciri - ciri suatu class
- Hal - hal yang dimiliki suatu class
- Memiliki sifat seperti variabel

```cs
class Hewan { // Membuat property
  int mata = 1;
  int kaki = 0;
}

void main() { // Mengakses property
  var h1 = Hewan();

  print(h1.mata);
  print(h1.kaki);
}
```
### Method
- Sifat suatu class 
- Aktivitas yang dapat dikerjakan suatu class
- Memiliki sifat seperti fungsi

```cs
class Sapi { // Membuat method
  void makan() {
    print('makan');
  }
}

void main() { // Mengakses method
  var h1 = Sapi();
  h1.makan();
}
```