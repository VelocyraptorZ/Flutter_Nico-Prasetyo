# RESUME SECTION 28 UI Testing

## Data Diri
Nomor Urut  : 1_016FLC_34 <br>
Nama        : Nico Prasetyo

## Summary UI Testing

### UI Testing
Pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna

### UI Testing Flutter
Disebut widget testing sehinga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis

#### Keuntungan UI Testing
- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- Menjadi ketentuan yang harus diikuti saat diperlukan perubahan widget

### Melakukan Testing
- Instalasi package testing (flutter_test) sudah ada pada pubspec.yaml
- Penulisan Script Testing 
    - dilakukan pada folder test
    - nama file harus diikuti <b>_test.dart</b>
    - tiap file berisi fungsi main() yang didalamnya dapat dituliskan script testing 
    - tiap skenario pengujian disebut test case 
    ```cs
    void main() {
        testWidgets ('Judul Halaman Harus ....', (WidgetTester) async{
        });

        testWidgets ('Tombol Harus ....', (WidgetTester) async{
        });
    }
    ``` 
- Script Testing 
    - Test case diawali dengan testWidgets dan diberi judul 
    - Simulasi proses mengaktifkan halaman AboutScreen
    - Memeriksa apakah dihalaman tersebut terdapat teks "About Screen"
    ```cs
     testWidgets ('Judul Halaman Harus ....', (WidgetTester) async{

        await tester.pumpWidget(
            const MaterialApp(
                home: AboutScreen(),
            ),
        );

        expect(find.text('About Screen'), findsOneWidget);

    });
    ```
- Menjalankan Testing
    - Menggunakan perintah <b>flutter test</b>   
    - Perintah flutter test akan menjalankan seluruh file test yang dibuat
    - Hasil perintah adalah lama waktu pengujian, total pengujian dan pesan pengujian berhasil


