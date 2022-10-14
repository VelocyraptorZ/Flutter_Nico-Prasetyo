# RESUME SECTION 26 MVVM Architecture

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary MVVM Architecture

### MVVM Architecture
Model View View Model (MVVM) merupakan salah satu architectural pattern yang dipakai dalam pengembangan perangkat lunak berbasis Graphical User Interface (GUI), arsitektur ini memisahkan business logic dengan GUI. Pada Android SDK sendiri, telah tersedia library Data Binding dari API level 7+

### Manfaat MVVM Architecture
- Reusability <br>
Jika ada beberapa tampilan yang memerlukan alur logic yang sama mereka bisa menggunakan ViewModel yang sama 
- Maintainability <br>
Mudah dirawat karena perkerjaan terkait tampilan tidak tertumpuk bersama logic 
- Testability <br>
Penguji menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian

### Struktur Direktori 
- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut 
- Tiap screen diletakkan dalam sebuah direktori yang didalamnya terdapat View dan ViewModel

### Model
- Bentuk data yang akan digunakan, dibuat dalam bentuk class
- Data-data yang dimuat, diletakkan pada property

```cs
class Contact {
    final int id;
    final String name;
    final String phone;

    Contact({required this.id, required this.name, required this.phone});
}
```

### Model API
```cs
class ContactAPI {
    static Future <List<Contact>> getContact() async {
        final response = await Dio()
            .get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');
        
        List<Contact> contact = (response.data as List)
        .map((e) => Contact(id: e['id'], name: e['name'], phone: e[phone])).toList();

        return contacts;
    }
}
```

### ViewModel
- Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
- Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

```cs
class ContactViewModel with ChangeNotifier {

    List<Contact> _contacts = [];

    List<Contact> get contacts => _contacts;

    getAllContacts() async {
        final c = await ContactAPI.getContacts();
        _contacts = c;
        notifyListeners();
    }
}
```

### Mendaftarkan ViewModel
- Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel
- MaterialApp sebagai child utama

```cs
runApp(
    MultiProvider(
        providers: [
            changeNotifierProvider(
                create: (_) => ContactViewModel();
            )
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false;
            home: ContactScreen(),
        ),
    ),
);
```

### View
- Menggunakan StatefulWidget
```cs
@override
void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp){
        Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
}
```

### Menampilkan Data di View
- Letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets
```cs
final modelView = Providers.of<ContactViewModel>(context);

return Scaffold(
    appBar: AppBar(
        title: const Text('Contacts'), 
        ),
    body: ListView.builder(
        itemCount: countView.contacts.length,
        itemBuilder: (context, index) {
            final contact = modelView.contacts[index];
            return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
            );
        },
    ) ,
);
```

