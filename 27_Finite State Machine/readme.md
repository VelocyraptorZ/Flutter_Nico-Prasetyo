# RESUME SECTION 27 Finite State Machine & Unit Testing

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Finite State Machine & Unit Testing

### Finite State Machine
- Mesin yang memiliki sejumlah state
- Tiap state menunjukkan apa yang terjadi sebelumnya <br>
Contoh : <br>
Terdapat 3 state yang menunjukkan kejadian dalam suatu proses <br>
    - IDDLE saat tidak terjadi proses 
    - RUNNING saat proses sedang berjalan 
    - ERROR saat proses gagal diselesaikan 

### Implementasi pada ViewModel

#### Menambah ENUM
Membuat enum pada masing masing state :
- none saat IDLE
- loading saat RUNNING
- error saat ERROR

```cs
enum ContactViewState {
    none,
    loading,
    error,
}
```

#### Menambah Getter Setter
Membuat getter setter untuk menyimpan state dari widget

```cs
class ContactViewModel with ChangeNotifier {

    ContactViewState _state = ContactViewState.none;
    ContactViewState get state => _state;

    changeState(ContactViewState s) {
        _state = s
        notifyListeners();
    } 

}
```

#### Gunakan State
Tiap proses yang perlu state tersebut, dapat memanfaatkannya

```cs
class ContactViewModel with ChangeNotifier {
    
    getAllContacts() async {
        changeState(ContactViewState.loading);

        try {
            final c = await ContactAPI.getAllContacts();
            _contacts = c;
            notifyListeners();
            changeState(ContactViewState.none);
        } catch (e) {
            changeState(contactViewState.error);
        }
    }

}
```

### Implementasi pada Widget

#### Perbedaan Tampilan Tiap State
Informasi finite state dapat berguna untuk menentukan seperti apa tampilan yang dimunculkan 

```cs
Widget body(ContactViewModel viewModel) {
    final isLoading = viewModel.state == ContactViewState.loading;
    final isError = viewModel.state == ContactViewState.error;

    if(isLoadng) {
        return const Center(child: CircularProgressIndicator());
    }

    if(isError) {
        return const Center(child: Text('Gagal mengambil data'));
    }

    return listView(viewModel);    
}
```

### Unit Test
- Salah satu jenis pengujian pada perangkat lunak 
- Pengujian dilakukan pada unit dalam perangkat lunak 
- Unit yang dimaksud umumnya adalah fungsi atau method

### Tujuan Unit Test
- Memastikan fungsi dapat mengolah berbagai jenis input
- Memastikan hasil dari suatu fungsi atau method sudah sesuai 
- Menjadi dolumentasi

### 2 Cara Unit Test
- Manual <br>
Unit dijalankan dan dicek hasilnya secara manual
- Automated <br>
Menulis script yang dapat dijalankan berkali kali menggunakan test runner

#### Menambah Dependencies
- Tambah <b>test</b>, pada bagian dev_dependencies di file pubspec.yaml

#### Menulis Test Script
- Import package test
- Membuat test case
- Menjalankan fungsi
- Cek hasil dengan expect 

```cs
import 'package:test/test.dart';

void main() {

    test('get all contacts return data', () async {
        var contacts = await ContactAPI.getAllContacts();
        expect(contact.isNotEmpty, true)
    });

}
```

#### Mengelompokan Test
- Beberapa Test dengan subjek yang sama diletakkan dalam sebuah kelompok
- Dilakukan dengan menggunakan Group

```cs
import 'package:test/test.dart';

void main() {

    group('ContactAPI', () {
        test('get all contacts return data', () async {
            var contacts = await ContactAPI.getAllContacts();
            expect(contact.isNotEmpty, true)
        });
    });

}
```

#### Menjalankan Test
- Menggunakan perintah <b>flutter test</b>

### Mocking
- Proses yang terikat dengan sistem eksternal dapat mempengaruhi berjalannya pengujian 
- Pengaruh tersebut dapat menggangu proses pengujian 
- Dilakukan mocking untuk menghindari masalah masalah tersebut

### Cara Kerja Mocking
- Suatu object dibuat bentuk tiruannya
- Bentuk tiruan tersebut memiliki input dan output yang sama dengan asli
- Bentuk tiruan menghilangkan ketergantungan pada sistem eksternal

#### Menambah Dependencies
- Tambah <b>mockito</b> dan <b>build_runner</b>, pada bagian dev_dependencies di file pubspec.yaml

#### Melakukan Mocking I
- Mengubah kode agar dapat dilakukan mocking

```cs
//Sebelum
class ContactAPI {
    static Future<List<Contact>> getAllContacts() async {
        final response = ...;
        List<Contact> contacts = ...;
        return contacts;
    }
}

//Sesudah
class ContactAPI {
    Future<List<Contact>> getAllContacts() async {
        final response = ...;
        List<Contact> contacts = ...;
        return contacts;
    }
}
```

#### Melakukan Mocking II
- Memasang annotation untuk membuat mock

```cs
import 'package:test/test.dart';
import 'package:mockito/mockito.dart'; //Import Mockito
import 'package:mockito/annotations.dart';

@GenerateMocks([ContactAPI]) //Menggunakan Annotation
void main() {

    group('ContactAPI', () {
        test('get all contacts return data', () async {
            var contacts = await ContactAPI.getAllContacts();
            expect(contact.isNotEmpty, true)
        });
    });

}
```

#### Melakukan Mocking III
- Membuat file mock dengan menjalankan perintah <b>flutter pub run build_runner build</b>

#### Melakukan Mocking IV
- Menggunakan mock yang telah dibuat

```cs
import 'package:test/test.dart';
import 'package:mockito/mockito.dart'; //Import Mockito
import 'package:mockito/annotations.dart';
import 'contact_api_test.mocks.dart';

@GenerateMocks([ContactAPI]) //Menggunakan Annotation
void main() {

    group('ContactAPI', () {
        ContactAPI contactAPI = MockContactAPI(); //Membuat object mock

        test('get all contacts return data', () async {
            when(contactAPI.getAllContacts()).thenAnswer(
                (_) async => <Contact>[
                    Contact(id: 1, name: 'a', phone: '0'), //Persiapan
                ],
            );

            var contacts = await ContactAPI.getAllContacts();
            expect(contact.isNotEmpty, true)
        });
    });

}
```