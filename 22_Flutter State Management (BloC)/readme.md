# RESUME SECTION 22 Flutter State Management (BLoC)

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Flutter State Management (BLoC)

### Declarative UI
- Flutter memiliki sifat declarative yang artinya flutter membangun UI nya pada screen untuk mencerminkan keadaan state saat ini

### State 
- State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori 
- Flutter akan membangun ulang UI nya ketika ada State atau data yang berubah 
- Ada 2 jenis state dalam flutter, ephemeral state dan app state

### Ephemeral State
- Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widgetnya, contoh (Page View, BottomNavigationBar, Switch Button)
- Tidak perlu state management yang kompleks 
- Hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState()

### App State 
- Digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget, contoh (Login Info, Pengaturan preferensi pengguna, Keranjang Belanja)

### Pendekatan State Management
- setState
Lebih cocok penggunaannya pada ephemeral state 
- Provider
Penggunaan untuk state management yang lebih kompleks seperti app state, pendekatan ini direkomendasikan oleh tim flutter karena mudah pelajari
- Bloc
Menggunakan pola stream/observable, untuk memisahkan UI dengan bisnisnya logicnya

### Provider
Class yang perlu diperhatikan dalam penggunaan provider, yaitu:
#### Dari Package Provider
- ChangeNotifierProvider <br>
a. Widget yang membungkus sebuah class <br>
b. Mengimplementasikan ChangNotifier dan menggunakan child untuk widget UInya <br>
c. Menggunakan create, provider yang akan menyimpan model yang telah dibuat <br>

- MultiProvider <br>
a. Jika membutuhkan lebih dari satu provider

- Consumer <br>
a. Widget yang mendengarkan perubahan kelas yang mengimplementasikan ChangeNotifier <br>
b. Membangun ulang widget yang dibungkus Consumer saja <br>
c. Penting untuk meletakan Consumer pada lingkup sekecil mungkin <br>
d. Membutuhkan properti builder yang berisi context, model, dan child <br>

#### Built in Class dari Flutter SDK
- ChangeNotifier <br>
a. Class yang menambahkan dan menghapus listeners <br>
b. Digunakan dengan cara meng-extends <br>
c. Memanggil notifyListeners(), fungsi yang memeberitahu widget yang menggunakan state bahwa terjadi perubahan data sehingga UI nya harus dibagun ulang <br>

### BLoC 
- BLoC (Business Logic Component)
- Memisahkan antara business logic dengan UI

#### BLoC dibuat dengan mempertimbangkan tiga prinsip panduan:
- Simple: Mudah dipahami dan dapat digunakan oleh pengembang dari semua tingkat keahlian.
- Powerful: Membantu dalam pembuatan aplikasi yang luar biasa dan canggih dengan memecahnya menjadi komponen yang lebih kecil.
- Testable: Dapat dengan mudah menguji setiap bagian aplikasi.

#### Cara Kerja BLoC
- Menerima event sebagai input
- Dianalisa dan Dikelola didalam BloC
- Menghasilkan state sebagai output