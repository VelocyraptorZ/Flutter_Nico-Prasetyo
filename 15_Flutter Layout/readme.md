# RESUME SECTION 15 Flutter Layout

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary Flutter Layout

### Layout
- Untuk mengatur tata letak
- Layout berbentuk widget yang mengatur widget didalamnya

### Single Child Layout 
- Widget yang hanya dapat memiliki SATU widget di dalamnya. Tipe widget ini memiliki properti yang bernama “child” digunakan untuk memasukan widget lain kedalam single child widget

#### Container
- Membuat sebuah Box 
- Membungkus widget lain
- Box memiliki margin, padding, dan border

```cs
Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(),
        ),
      child: const Text('Hello'),  
    ),
);
```

#### Center
- Membuat sebuah Box
- Membungkus widget lain
- Memenuhi lebar dan tinggi ruang diluarnya
- Meletakkan widget berada dibagian tengah

#### SizedBox
- Membuat sebuah Box
- Membungkus widget lain
- Box dapat diatur lebar dan tingginya
- Lebih sederhana dan container

### Multi Child Layout

#### Column
- Mengatur widgets secara vertical

#### Row
- Mengatur widgets secara horizontal

#### ListView
- Mengatur widgets dalam bentuk list
- Memiliki kemampuan scroll

### GridView
- Mengatur widgets dalam bentuk galeri