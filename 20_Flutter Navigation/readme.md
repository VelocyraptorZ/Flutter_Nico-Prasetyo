# RESUME SECTION 19 Flutter Navigation

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Flutter Navigation

##### Navigation
- Berpindah dari halaman satu ke halaman lain 

#### Navigation Dasar
- Perpindahan halaman menggunakan (Navigator.push())
- Kembali kehalaman sebelumnya menggunakan (Navigator.pop())

#### Navigation dengan Named Routes
- Tiap halaman memiliki alamat yang disebut route
- Perpindahan halaman menggunakan (Navigator.pushNamed())
- Kembali kehalaman sebelumnya menggunakan (Navigator.pop())

#### Mendaftarkan Route
- Tambahkan initialRoute dan routes pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman

```cs
MaterialApp{
    initialRoute: '/',
    route: {
        '/': (_) => const HomeScreen(),
        '/about' : (_) => const AboutScreen(),
    },
};
```