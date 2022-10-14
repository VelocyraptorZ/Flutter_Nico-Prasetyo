# RESUME SECTION 25 Flutter Introduction REST API - JSON serialization/deserialization

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo 

## Summary Flutter Introduction REST API - JSON serialization/deserialization

### REST API
Representational State Transfer Application Programming Interface
- Astitektural yang memisahkan tampilan dengan proses bisnis 
- Bagian tampilan dengan proses bisnis berkirim data melalui HHTP Request

### HTTP
Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web
#### Pola Komunikasi
- Client mengirim request
- Server mengolah dan membalas dengan memberi response

##### Struktur Request
- URL <br>
Alamat halaman yang akan diakses
- Method (GET, POST, PUT, DELETE) <br>
Menunjukkan aksi yang diinginkan  
- Header <br>
Informasi tambahan terkait request yang dikirimkan  
- Body <br>
Data yang disertakan bersama request

##### Struktur Response 
- Status Code <br>
Kode yang mewakili keseluruhan response, baik sukses maupun gagal  
- Header <br>
Informasi tambahan terkait response yang diberikan  
- Body <br>
Data yang disertakan bersama response

### Dio
- Sebagai HTTP Client
- Dimanfaatkan untuk melakukan REST API

### Serialisasi JSON
Mengubah struktur data ke bentuk JSON

### Deserialisasi JSON
Mengubah bentuk JSON ke struktur data