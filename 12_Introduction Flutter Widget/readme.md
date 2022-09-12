# RESUME SECTION 12 Introduction Flutter Widget

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Introduction Flutter Widget

### Flutter
- Alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, dekstop, dan web.
#### Keunggulan Flutter 
- Mudah digunakan dan dipelajari.
- Produktivitas tinggi.
- Dokumentasi lengkap.
- Komunitas yang berkembang.
#### Bagian Flutter
- SDK (Software Development Kit) <br>
Alat - alat untuk membantu proses pengembangan aplikasi.
- Framework <br>
Perlengkapan untuk membentuk aplikasi yang dapat dikustomisasi. 

### Widget
- Digunakan untuk membentuk antarmuka (UI).
- Berupa class.
- Dapat terdiri dari beberapa widget lainnya.

#### Stateless Widget
- Tidak Tergantung pada perubahan data. 
- Hanya fokus pada tampilan.
- Dibuat dengan extends pada class Stateless Widget.

```cs
class MyWidget extends StatelessWidget {
    const MyWidget({Key? key}) : super(key : key);

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat Datang Di Flutter');
            ),
        );
    }
}
```

#### Stateful Widget
- Mementingkan pada perubahan data.
- Dibuat dengan extends pada class Stateful Widget.
- 1 Widget menggunakan 2 class (Widget dan State).

```cs
class MyWidget extends StatefulWidget {
    const MyWidget({Key? key}) : super(key : key);

    @override
    createState() => MyWidgetState()
}

class MyWidgetState extends State<MyWidget> {

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat Datang Di Flutter');
            ),
        );
    }
}
```

### Built in Widget
- Widget yang dapat langsung digunakan.
- Sudah terinstall bersama flutter.

#### MaterialApp
- Membangun aplikasi dengan desain material.
```cs
const MaterialApp(
    home: Text('Selamat Datang Di Flutter'),
    );  
```

#### Scaffold
- Membentuk sebuah halaman.
```cs
const Scaffold(
    home: Text('Selamat Datang Di Flutter'),
    );  
```

#### AppBar
- Memebentuk application bar yang terletak pada bagian atas halaman.
```cs
AppBar(
    title: const Text('Home'), 
);
```

#### Text
- Menampilkan text.
```cs
const Text('Hello World'); 
```