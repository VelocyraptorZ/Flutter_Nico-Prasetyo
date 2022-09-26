# RESUME SECTION 17 Form Input Button

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Form Input Button

### Form
- Menerima Isian Data dari Pengguna
- Isian data dapat lebih dari satu

#### Membuat Form
- Menggunakan StatefulWidget
- Keadaan form disimpan menggunakan GlobayKey<FormState>

```cs
//property
var formKey = GlobayKey<FormState>

//build
Form(
    key: formKey,
    child: inputWidgets,
);

```


### Input (TextField)
- Menerima isian data dari pengguna
- Isisan data dapat lebih dari satu 

#### Membuat TextField
- Data diambil menggunakan TextEditingController
- Isian data berupa teks

```cs
//property
var inputController = TextEditingController();

//build
TextField(
    controller: inputController,
);
```

### Radio
- Memberi opsi pada pengguna
- Hanya dapat memilih satu opsi

#### Membuat Radio
- Data diambil menggunakan property dengan tipe data sesuai value pada radio

```cs
//property
var radioButton = '';

//build
Radio<String>(
    value: 'Laki - Laki',
    groupValue: radioValue,
    onChanged: (String? value) {
        setState((){
            radioValue = value ?? '';
        });
    },
);
```

### Checkbox
- Memberi opsi pada pengguna
- Dapat memilih beberapa opsi

#### Membuat Checkbox
- Data diambil menggunakan property bertipe bool

```cs
//property
var checkValue = false;

//build
Checkbox(
    value: checkValue,
    onChanged(bool? value){
        setState((){
            checkValue = value ?? false;
        });   
    },
);
```

### Dropdown Button
- Memberi opsi pada pengguna
- Hanya dapat memilih satu opsi
- Opsi tidak ditampilkan diawal, hanyak tampil jika ditekan

#### Membuat DropdownButton
- Data diambil menggunakan property dengan tipe data sesuai value pada DropdownMenuItem

```cs
//property
var dropdownValue = 0;

//build
DropdownButton(
    value: dropdownValue,
    onChanged(int? value){
        setState((){
            dropdownValue = value ?? 0;
        });   
    },
    items: const [
        DropdownMenuItem(
            value: 0,
            child: Text('Pilih...'), 
        ),
        DropdownMenuItem(
            value: 1,
            child: Text('Satu'), 
        ),
        DropdownMenuItem(
            value: 2,
            child: Text('Dua'), 
        ),
        DropdownMenuItem(
            value: 3,
            child: Text('Tiga'), 
        ),
    ],
);
```

### Button
- Bersifat seperti tombol
- Dapat melakukan sesuatu saat ditekan

### Elevated Button
- Tombol yang timbul
- Jika ditekan, akan menjalankan onPressed

```cs
ElevatedButton(
    child: const Text('Submit'),
    onPressed: (){
        //TODO
    },
);
```

### Icon Button
- Tombol yang hanya menampilkan icon
- Jika ditekan, akan menampilkan onPressed

```cs
IconButton(
    child: const Icon(Icons.add),
    onPressed: (){
        //TODO
    },
);
```