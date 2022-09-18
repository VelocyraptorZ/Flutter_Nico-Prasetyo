# RESUME SECTION 14 Flutter Command Line Interface (CLI) and Flutter package management

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Flutter Command Line Interface (CLI) and Flutter package management

### Flutter CLI
- Alat yang digunakan untuk berinteraksi dengan Flutter SDK
- Perintah dijalankan dalam terminal

#### Macam - Macam CLI Command :
- Flutter Doctor <br>
Perintah untuk menampilkan informasi software yang dibutuhkan flutter
- Flutter Create <br>
Perintah untuk membuat project aplikasi flutter baru di directory tertentu
- Flutter Run <br>
Perintah untuk menjalankan project aplikasi didevice yang tersedia
- Flutter Emulator <br>
Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru
- Flutter Channel <br>
Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukkan channel yang digunakan saat ini
- Flutter Pub add & get <br>
add = untuk menambahkan packages ke dependencies yang ada di pubspec.yaml <br>
get = untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml 
- Flutter Build <br>
Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlayStore, dll.
- Flutter Clean <br>
Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator, perintah ini akan memperkecil ukuran project

### Packages Management
- Flutter mendukung sharing packages
- Packages dibuat developers lain
- Memepercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
- Mendapatkan packages diwebsite pub.dev

#### Cara Menambahkan Packages
- Cari package di pub.dev
- Copy baris dependencies yang ada dibagian installing 
- Buka pubspec.yaml
- Paste baris pada dependencies pubspec.yaml
- Run flutter pub get diterminal
- Import package di file dart agar bisa digunakan 
- Stop atau restart aplikasi jika dibutuhkan