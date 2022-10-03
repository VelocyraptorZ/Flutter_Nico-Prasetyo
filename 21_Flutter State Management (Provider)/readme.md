# RESUME SECTION 21 Flutter State Management (Provider)

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Flutter State Management (Provider)

#### State
- Data yang dapat dibaca saat pembuatan widget
- Dapat berubah saat widget sedang aktif
- Hanya dimiliki oleh StatefulWidget

#### Manfaat State
- Dibuat sebagai property dari class
- Digunakan pada widget saat build

```cs
//property
var number = 0;

//build
Text('number');
```

#### Mengubah State
- Menggunakan method setState

```cs
ElevatedButton(
    child: const Text('Tambah'),
    onPressed: () {
        setState((){
            number = number + 1;
        });
    },
);
```

#### Global State
- State biasa yang dapat digunakan pada seluruh widget

#### Instalasi Provider
- Menambahkan package provider pada bagian dependencies dalam file pubspec.yaml
- Jalankan perintah flutter pub get

#### Membuat State Provider
- Buat file bernama contact.dart
- Definisikan state dalam bentuk class

```cs
import 'package: flutter/material.dart';

class Contact with ChangeNotifier {
    List<Map<String, String>> _contacts = [];

    List<Map<String, String>> get contacts => _contacts;

    void add(Map<String, String> contact) {
        _contacts.add(contact);
        notifyListeners();
    }
}
```

#### Mendaftarkan State Provider
- Import dalam file main.dart
- Daftarkan pada runApp dengan MultiProvider

```cs
import 'package: flutter/material.dart';
import 'package: provider/provider.dart';
import 'package: phonebookapp/stores/contact.dart' as contact_store;

void main() {
    runApp
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => contact_store.Contact())
            ],
            child: MyWidget(),
        );
}
```

#### Menggunakan State dari Provider
- Simpan provider dalam variable
- Ambil data dari provider melalui getter

```cs
final contactProvider = Provider.of<contact_store.Contact>(context);

ListView.builder(
    itemCount: contactProvider.contact.length,
    itemBuilder: (context, index) {
        return ListTile(
            title: Text(contactProvider.contacts[index]['name'] ?? ''),
            subtittle: Text(contactProvider.contacts[index]['phone'] ?? ''),
        );
    },
);
```