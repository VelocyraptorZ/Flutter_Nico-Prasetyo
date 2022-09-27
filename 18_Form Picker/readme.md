# RESUME SECTION 18 Form Picker (Basic Layouting) dan Form Picker (Advance User Input)

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Form Picker (Basic Layouting) 

### Row dan Column
- Row meletakkan widget children nya secara horizontal 
- Column meletakkan widget children nya secara vertical

### MainAxisSize Properti
- Menentukan seberapa banyak space menempati main axis
- Main axis dari Row adalah horizontal
- Main axis dari Column adalah vertical
- Properti mainAxisSize memiliki dua values, MainAxisSize.max dan MainAxisSize.min
- MainAxisSize.max menempati semua space dari main axis
- MainAxisSize.min tidak memiliki extra space, hanya untuk children nya saja.

### MainAxisAlignment Properti
Properti ini digunakan Row dan Column untuk memposisikan children mereka di extra space yang ada <br>

Memiliki 6 values:
- MainAxisAlignment.start
- MainAxisAlignment.end
- MainAxisAlignment.center
- MainAxisAlignment.spaceBetween
- MainAxisAlignment.spaceEvenly
- MainAixsAlignment.spaceAround

### CrossAxisAlignment Properti
- Properti ini digunakan Row dan Column untuk memposisikan children mereka pada cross axis
- Cross Axis dari Row adalah vertikal dan Cross Axis dari Column adalah horizontal <br>

Memiliki 5 values:
- CrossAxisAlignment.start
- CrossAxisAlignment.end
- CrossAxisAlignment.center
- CrossAxisAlignment.stretch
- CrossAxisAlignment.baseline

### Flexible Widget
- Membungkus widget lain sehingga child dari Flexible widget menjadi flexible atau resizable
- Sangat berguna untuk membuat aplikasi yang responsif
- Harus berada dalam turunan parent widget Row atau Column
- Perubahan ukuran ditentukan dengan properti fit dan flex

#### Fit Properti
- Menentukan apakah flexible widget memenuhi extra space yang tersedia di main axis nya
- Menerima nilai values berupa FlexFit.loose atau FlexFit.tight
- FlexFit.loose akan memiliki ukuran minimum
- FlexFit.tight akan memiliki ukuran maximum

#### Flex Properti
- Menentukan perbandingan ukuran dari child widget nya
- Menerima nilai values berupa integer
- Membandingkan nilai nya dengan flex properti lain

### Expanded Widget
- Membungkus widget lain sehingga ukuran dari child Expanded widget akan dipaksa untuk memenuhi ruang yang tersedia
- Sangat berguna untuk membuat aplikasi yang responsif
- Harus berada dalam turunan parent widget Row atau Column
- Memiliki default value FlexFit.tight
- Perubahan ukuran ditentukan dengan properti flex

## Form Picker (Advance User Input)

### Interactive Widget
- Interaksi antara aplikasi dan user
- Mengumpulkan input dan feedback dari user

### Date Picker
- Widget dimana user bisa memasukkan tanggal
- Tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll

#### Cara Membuat Date Picker
- Menggunakan fungsi bawaan flutter showDatePicker
- Fungsi showDatePicker memiliki tipe data future
- Menampilkan dialog material design date picker
- Menambahkan packages intl di pubspec.yaml

```cs
//Mempersiapkan Variabel
DateTime _dueDate = DateTime.now();
final currentDate = DateTime.now();

//Basic Code
final selectDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(1990),
    lastDate: DateTime(currentDate.year + 5),
);

//Menambahkan fungsi showDatePicker didalam onPressed
onPressed: () {
    final selectDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(1990),
    lastDate: DateTime(currentDate.year + 5),
    );
}

//Memanggil fungsi setState didalam onPressed
setState ((){
    if (selectDate != null) {
        _dueDate = selectDate;
    }
});
```

### Color Picker
- Widget dimana user bisa memilih color
- Penggunaan color picker bisa digunakan untuk berbagai macam kondisi

#### Cara Menggunakan Color Picker
- Menambahkan packages flutter_colorpicker

### File Picker
- Kemampuan widget untuk mengakses storage
- Memilih dan membuka file

#### Cara Menggunakan File Picker
- Menambahkan packages file_picker dan open_file