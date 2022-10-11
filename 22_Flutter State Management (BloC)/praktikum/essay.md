# PRAKTIKUM SECTION 22 Flutter State Management (BLoC)

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo <br>

#### 1. Buatlah halaman Home & halaman Create Contact, dengan detail sebagai berikut:<br>
-  Halaman Home akan menampilkan daftar kontak yang sudah didaftarkan dan sebuah tombol untuk navigasi ke halaman Create Contact.<br>
- Halaman Create Contact terdiri dari 2 kolom untuk mengisi nama, nomor telepon, dan sebuah tombol untuk menyimpan kontak yang baru dibuat.<br>
- Simpan hasil kontak yang baru dibuat dalam sebuah Map untuk nama dan emailnya.<br>
- Simpanlah hasil kontak baru di atas, menggunakan bloc. Detail bloc terdiri dari:<br>
    - Sebuah Event sebagai perintah untuk menyimpan hasil kontaknya<br>
    - Beberapa State seperti: <br>
a. Initial (State ini ditampilkan di UI ketika bloc tidak melakukan apa-apa atau dalam status idle).<br>
b. Loading (State ini ditampilkan di UI ketika bloc mulai melakukan penambahan kontak hingga selesai prosesnya) <br>
c. Loaded (State ini ditampilkan di UI ketika bloc selesai melakukan penambahan kontak baru, dan menampilkan daftar kontak tersebut ke dalam UI). <br>
d. Failed (State ini ditampilkan di UI ketika terjadi error pada saat melakukan penambahan kontak baru di bloc). <br>

#### 2. Buatlah sebuah bloc baru pada aplikasi Contact List sebelumnya. (Bloc baru ini tujuannya bebas, misal untuk menampilkan data diri setelah login dan lain-lain).

## Hasil Output Praktikum Section 21

![](../screenshots/Screenshot_LoginScreen.png)

![](../screenshots/Screenshot_EmptyScreen.png)

![](../screenshots/Screenshot_Failed%20to%20Save%20(Empty%20Data).png)

![](../screenshots/Screenshot_CreateNewContactScreen.png)

![](../screenshots/Screenshot_ContactListScreen(After%20Input%20Data).png)

![](../screenshots/Screenshot_ContactListScreen.png)


