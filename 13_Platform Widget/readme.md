# RESUME SECTION 13 Platform Widget

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Platform Widget

### MaterialApp
- Widget dasar yang mengemas seluruh widget dalam aplikasi
- Widget yang digunakan pada sistem android
- Di-import dari package:flutter/material.dart

#### Struktur MaterialApp
- Widget yang pertama kali dibuka, diletakkan pada bagian home
- Mengatur halaman juga dapat dilakukan dengan menggunakan routes dan initialRoute
```cs
MaterialApp(
    theme: ThemeData.dark(), //Mengatur tema aplikasi
    home: const HomePage(), //Halaman utama
    routes: { //Mendaftarkan halaman pada routes
        'home': (_) => const HomePage(),
    },
);
```

#### Scaffold
- Widget dasar untuk membangun sebuah halaman pada MaterialApp

#### Struktur Scaffold
- Memebentuk tata letak dasar sebuah halaman yang ditulis melalui properti - properti 
```cs
Scaffold(
    appBar: AppBar(...), //Bar menu bagian atas halaman 
    drawer: Drawer(...), //Menu bagian samping halaman 
    body: ..., //Bagian utama halaman 
    bottomNavigationBar: BottomNavigationBar (...), //Menu bagian bawah halaman
);
```

### CupertinoApp
- Widget dasar yang mengemas seluruh widget dalam aplikasi
- Widget yang digunakan pada sistem iOS
- Di-Import dari package:flutter/cupertino.dart

#### Struktur CupertinoApp
- Widget yang pertama kali dibuka, diletakkan pada bagian home.
```cs
CupertinoApp(
    theme: _themeDark, //Mengatur tema aplikasi
    home: const HomePage(), //Halaman utama
);
```

#### CupertinoPageScaffold
- Widget dasar untuk membangun sebuah halaman pada CupertinoApp 

#### Struktur CupertinoPageScaffold
- Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti - properti
```cs
CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(...), 
    child: ...,
;)
```