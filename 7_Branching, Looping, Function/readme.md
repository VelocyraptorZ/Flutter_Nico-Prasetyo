# RESUME SECTION 7 Branching, Looping, Function

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary
Branching, Looping, Function.

### Pengambilan Keputusan
Menentukan alur program pada kondisi tertentu
#### IF
- Memerlukan nilai bool (dari operator logical atau comparison).
- Menjalankan bagian proses jika nilai bool bernilai true.
```cs
void main() {
    var usia = 18;
    if (usia < 20) {
        print('remaja'); //proses bila nilai bool = true
    }
}
```
#### IF - ELSE
- Berjalan dengan if.
- Menambahkan alternatif jika nilai bool adalah false.
```cs
void main() {
    var usia = 18;
    if (usia < 20) {
        print('remaja'); //proses bila nilai bool = true
    } else {
        print('bukan golongan kami'); //proses bila nilai bool = false
    }
}
```

#### Sisipan IF - ELSE
- Berjalan dengan if.
- Menambahkan alternatif jika nilai bool adalah false.
- Menambahkan pengujian nilai bool lain.
```cs
void main() {
    var usia = 18;
    if (usia < 20) {
        print('remaja'); //proses bila nilai bool = true, usia kurang dari 20
    } else if (usia < 40){
        print('dewasa'); //proses bila nilai bool = true, usia kurang dari 40
    } else {
        print('bukan golongan kami'); //proses bila nilai bool = false
    }
}
```

### Perulangan
Menjalankan proses berulang kali

#### For
- Diketahui berapa kali perulangan terjadi 
- Memerlukan nilai awal
- Memerlukan nilai bool, jika true maka perulangan dilanjutkan  
- Memerlukan pengubah nilai
```cs
void main() {
    for(var i = 0; i < 10; i += 1 ){ //proses berulang jika nilai bool = true
        print(i);
    }
}
```

#### While
- Tidak diketahui berapa kali perulangan terjadi
- Memerlukan nilai bool, jika true maka perulangan dilanjutkan
```cs
void main() {
    var i = 0;
    while(i < 10) {
        print('i');
        i++;
    }
}
```

#### Do - While
- Mengubah bentuk while
- Proses dijalankan minimum sekali, akan diteruskan jika nilai bool = true 
```cs
void main() {
    var i = 0;
    do{
        print('i');
        i++;
    } while(i < 10);  
}
```

### Break and Continue
- Perulangan menggunakan nilai bool untuk lanjut atau berhenti
- Break and continue dapat menghentikan perulangan dengan mengabaikan nilai bool
- Continue dapat menghentikan satu kali proses

1. Break "Menghentikan seluruh proses perulangan"
```cs
void main() {
    for(var i = 0; true; i++) {
        if(i == 10){
            break;
        }
        print(i);
    }
}
```
2. Continue "menghentikan satu kali proses perulangan"
```cs
void main() {
    for(var i = 0; i < 10; i += 1) {
        if(i == 5) {
            continue;
        }
        print(i);
    }
}
```
### Fungsi
Kumpulan kode yang dapat digunakan ulang

- Kumpulan Perintah.
- Dapat digunakan berulang kali.
- Cukup mengubah fungsi sekali, penggunaan lainya akan ikut berubah.

Membuat Fungsi
```cs
void hello() {
    print('Hello World');
}
```

Memanggil Fungsi
```cs
void main() {
    hello();
}
```

Fungsi dengan Parameter
```cs
void tampil(String teks) {
    print(teks);
}

void main() {
    tampil('hello');
}
```

Fungsi dengan Return
```cs
int jumlah(int a, int b) {
    return a + b
}

void main(){
    var hasil = jumlah(1, 2);
    print(hasil);
}
```