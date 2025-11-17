# <span style="color:blue; padding:10px">***⚽SHOT-ON-TARGET🎯</span> <span style="color:red">MARKET🛍️</span>*** #
___
🔥*Your One-Stop Market, Always on Target!*🔥
___

# <p align="center">**TUGAS 7**</p>
## ***Widget tree pada Flutter dan hubungan parent-child bekerja***
***Widget Tree*** adalah representasi hierarki dari semua widget yang membentuk antarmuka pengguna (UI) aplikasi Flutter. Seperti halnya sebuah pohon keluarga, di mana setiap anggota keluarga adalah sebuah widget. Pohon ini dimulai dari satu widget utama (root widget) dan bercabang ke widget-widget lain yang lebih kecil, yang pada gilirannya bisa memiliki widget anak mereka sendiri.<br>Setiap elemen visual yang dilihat pada aplikasi Flutter, seperti tombol, teks, gambar, tata letak, merupakan sebuah widget. Widget-widget ini disusun dalam struktur hierarki yang terdefinisi dengan baik, yang disebut *Widget Tree*.
```
Container
└── Row
    ├── Column
    │   ├── Icon
    │   └── Container
    │       └── Text
    ├── Column
    │   ├── Icon
    │   └── Container
    │       └── Text
    └── Column 
        ├── Icon
        └── Container
            └── Text
```
Dalam Widget Tree, hubungan ini sangat fundamental:<br>- ***Parent Widget***: Sebuah widget yang memiliki satu atau lebih widget di dalamnya. *Parent Widget* bertanggung jawab untuk menentukan tata letak, posisi, dan kadang-kadang gaya dari widget anak-anaknya.<br>- ***Child Widget***: Sebuah widget yang terletak di dalam widget lain. *Child Widget* menerima batasan (constraints) dari induknya dan merender kontennya di dalam area yang diberikan oleh induk.<br><br>**Aturan**: <br>- *Constraints go down*, *Parent Widget* memberikan batasan ukuran (lebar dan tinggi maksimum/minimum) kepada widget anaknya.<br>- *Sizes go up*, *Child Widget*, setelah menerima batasan, menentukan ukuran yang diinginkannya sendiri (seringkali berdasarkan kontennya) dan melaporkannya kembali ke *Parent Widget*.<br>- *Parent sets position*, posisi *Parent Widget* menentukan urutan seperti *first, second,* dst untuk *column*.<br><br> **Pentingnya Widget Tree**:<br>- *Render Efisien*: Flutter menggunakan *Widget Tree* untuk mengoptimalkan proses rendering. Ketika ada perubahan pada UI, Flutter membandingkan *Widget Tree* lama dengan yang baru (menggunakan algoritma diffing) untuk mengidentifikasi bagian mana saja yang perlu diperbarui, daripada merender ulang seluruh UI.<br>- Organisasi UI: Membantu dalam menyusun dan memahami struktur UI yang kompleks.<br>- *InheritedWidget*: Memungkinkan data untuk diteruskan ke bawah pohon tanpa harus meneruskannya secara eksplisit melalui setiap konstruktor widget.

## ***Semua widget yang digunakan***
1. ```MaterialApp```:<br>Fungsi: Sebuah widget yang membungkus seluruh aplikasi Material Design. Ini menyediakan fungsionalitas inti seperti navigasi, tema, dan lokal. Ini adalah titik masuk untuk aplikasi yang mengikuti pedoman Material Design.
2. ```Scaffold```:<br>Fungsi: Mengimplementasikan struktur tata letak visual dasar dari Material Design. Ini menyediakan API untuk menampilkan laci (drawer), snack bar, bottom sheet, dan juga memiliki slot untuk appBar, body, dan floatingActionButton.
3. ```AppBar```:<br>Fungsi: Sebuah bilah horizontal di bagian atas Scaffold yang biasanya menampilkan judul aplikasi, tombol navigasi, dan kadang-kadang aksi lain.
4. ```Text```:<br>Fungsi: Menampilkan string teks. Ini adalah salah satu widget paling dasar untuk menampilkan informasi tekstual kepada pengguna.
5. ```Center```:<br>Fungsi: Sebuah widget tata letak yang mencoba untuk menempatkan widget anaknya di tengah area yang tersedia untuk dirinya sendiri.
6. ```Column```:<br>Fungsi: Sebuah widget tata letak yang menampilkan daftar widget anak-anaknya secara vertikal.
7. ```Row```:<br>Fungsi: Sebuah widget tata letak yang menampilkan daftar widget anak-anaknya secara horizontal.
8. ```Container```:<br>Fungsi: Sebuah widget serbaguna yang dapat digunakan untuk tata letak, painting, dan penentuan posisi. Ini bisa digunakan untuk menambahkan margin, padding, border, background color, dan juga untuk menentukan ukuran widget anak.
9. ```Padding```:<br>Fungsi: Sebuah widget tata letak yang memberikan ruang kosong (padding) di sekeliling widget anaknya.
10. ```SizedBox```:<br>Fungsi: Sebuah widget sederhana yang dapat digunakan untuk memberikan ruang kosong dengan ukuran tertentu atau untuk memaksa anak memiliki ukuran tertentu.

## ***Fungsi dari Widget MaterialApp***
**Fungsi dari `MaterialApp` Widget:**

`MaterialApp` adalah widget inti di Flutter yang menyediakan fungsionalitas yang diperlukan untuk membangun aplikasi yang sesuai dengan pedoman **Material Design** dari Google. Fungsi utamanya meliputi:

1.  **Routing dan Navigasi:** Mengelola rute aplikasi yang memungkinkan berpindah antar layar (pages) yang berbeda. Ini menyediakan `Navigator` dan `Router` di bawah *tree*.
2.  **Theming:** Mendefinisikan tema visual (warna, tipografi, bentuk) untuk seluruh aplikasi, sehingga dapat menerapkan gaya yang konsisten.
3.  **Localization:** Mendukung berbagai bahasa dan lokal untuk aplikasi.
4.  **Overlay dan Dialog:** Menyediakan *context* yang diperlukan untuk menampilkan *overlay*, dialog, *snackbars*, dan elemen UI temporal lainnya di atas konten utama aplikasi.
5.  **Semantics:** Mendukung aksesibilitas dengan menyediakan struktur semantik untuk widget di bawahnya.
6.  **Binding:** Ini mengikat mesin Flutter ke sistem rendering, memungkinkan segala sesuatu berfungsi dengan benar.

**Mengapa `MaterialApp` Sering Digunakan Sebagai Widget Root:**

1.  **Integrasi Material Design:** Jika meinginkan aplikasi terlihat dan terasa seperti aplikasi Android modern (atau aplikasi yang mengikuti pedoman Material Design), `MaterialApp` adalah pilihan yang tepat. Ini secara otomatis menyediakan banyak elemen dan perilaku yang diharapkan dari Material Design.
2.  **Menyediakan Context Global:** `MaterialApp` menyediakan `BuildContext` global yang diperlukan oleh banyak widget Material Design lainnya (seperti `Scaffold`, `AppBar`, `Navigator`, dll.) untuk berfungsi dengan benar. Tanpa `MaterialApp` sebagai root, widget-widget ini mungkin tidak menemukan *ancestor* yang diperlukan dan akan mengalami kesalahan.
3.  **Memudahkan Navigasi:** Dengan `MaterialApp`, mendapatkan `Navigator` secara *default*, yang sangat penting untuk manajemen layar dan navigasi aplikasi. Developer dapat menentukan rute, mendorong dan mengeluarkan halaman dengan mudah.
4.  **Manajemen Tema dan Pengaturan Global:** `MaterialApp` adalah tempat yang ideal untuk menentukan tema aplikasi, judul aplikasi, halaman awal (`home`), dan pengaturan global lainnya yang berlaku untuk seluruh aplikasi.
5.  **Aplikasi yang Konsisten:** Pengguna berharap aplikasi memiliki konsistensi dalam tampilan dan perilaku. `MaterialApp` membantu mencapai ini dengan menyediakan fondasi yang kuat untuk Material Design.

Meskipun ada `CupertinoApp` untuk aplikasi bergaya iOS, `MaterialApp` adalah pilihan *default* untuk aplikasi lintas platform atau aplikasi yang mengadopsi Material Design.

## ***Perbedaan antara `StatelessWidget` dan `StatefulWidget`***
Dua jenis widget dasar di Flutter adalah `StatelessWidget` dan `StatefulWidget`. Perbedaan utamanya terletak pada kemampuan mereka untuk mengelola dan bereaksi terhadap perubahan data atau "state".<br><br>
**`StatelessWidget`**
*   **Definisi:** Sebuah widget yang tidak memiliki "state" yang berubah sepanjang waktu hidupnya. Setelah dibangun, tampilan `StatelessWidget` tidak akan berubah kecuali input (parameter) yang diberikan kepadanya berubah oleh widget induknya.
*   **Karakteristik:**
    *   Tidak ada *internal state* yang dapat diubah.
    *   Properti widget diatur saat konstruksi dan tetap konstan.
    *   Tidak memiliki metode `setState()`.
    *   Dirender sekali dan tidak akan dibangun ulang kecuali ada perubahan pada konfigurasi induknya.
*   **Contoh:** `Text`, `Icon`, `Image`, `Container`, `Column`, `Row`, `AppBar`.
*   **Kapan Memilih `StatelessWidget`:**
    *   Ketika tampilan UI tidak berubah berdasarkan interaksi pengguna atau data eksternal.
    *   Ketika widget hanya berfungsi untuk menampilkan informasi yang diberikan kepadanya.
    *   Misalnya: Menampilkan judul statis, ikon, atau sebuah kalimat.

**`StatefulWidget`**
*   **Definisi:** Sebuah widget yang memiliki "state" yang dapat berubah sepanjang waktu hidupnya. Widget ini dapat dibangun ulang beberapa kali sebagai respons terhadap perubahan internal (seperti interaksi pengguna) atau data eksternal.
*   **Karakteristik:**
    *   Memiliki *internal state* yang dapat berubah.
    *   Menggunakan objek `State` yang terpisah untuk mengelola state.
    *   Memiliki metode `setState()` yang memicu pembangunan ulang widget.
    *   Dirender ulang (metode `build` dipanggil lagi) setiap kali `setState()` dipanggil, atau ketika ada perubahan pada `InheritedWidget` yang relevan.
*   **Contoh:** `Checkbox`, `Radio`, `Slider`, `TextField`, `Scaffold`, `GestureDetector`, `AnimatedContainer`.
*   **Kapan Memilih `StatefulWidget`:**
    *   Ketika tampilan UI perlu berubah sebagai respons terhadap interaksi pengguna (misalnya, tombol yang mengubah teks, *checkbox* yang dicentang).
    *   Ketika widget perlu memuat data secara asinkron (misalnya, dari API) dan menampilkan hasil setelah data tersedia.
    *   Ketika widget memiliki *timer* atau animasi yang mengubah UI seiring waktu.
    *   Misalnya: Sebuah *counter* yang bertambah saat tombol ditekan, formulir input yang memvalidasi teks.

## ***BuildContext dan Mengapa Penting di Flutter***
`BuildContext` adalah "lokasi" atau "referensi" ke sebuah widget di dalam Widget Tree. Setiap widget di Flutter memiliki `BuildContext`-nya sendiri. `BuildContext` ini berfungsi sebagai *handle* ke lokasi widget di dalam *tree*, dan ini memungkinkan widget untuk:
*   **Menemukan Ancestor Widgets:** Mengakses data atau fungsionalitas yang disediakan oleh *parent* atau *ancestor widget* di atasnya dalam *tree* (misalnya, tema aplikasi melalui `Theme.of(context)` atau `Navigator` melalui `Navigator.of(context)`).
*   **Mencari Descendant Widgets:** Meskipun lebih jarang, dalam kasus tertentu, bisa digunakan untuk berinteraksi dengan widget anak.
*   **Mengakses Sumber Daya:** Memungkinkan widget untuk mengakses berbagai sumber daya seperti tema (`Theme`), media *queries* (`MediaQuery`), *localization data*, dan lainnya, yang seringkali disediakan oleh `InheritedWidget` yang ada di atasnya dalam *tree*.

**Mengapa `BuildContext` Penting di Flutter?**
1.  **Akses ke Tema dan Gaya:** Ini memungkinkan widget untuk mengadopsi tema dan gaya aplikasi secara konsisten. Misalnya, `Theme.of(context)` akan memberikan objek `ThemeData` yang aktif di lokasi *context* tersebut.
2.  **Navigasi:** Fungsi-fungsi navigasi (`Navigator.of(context).push()`, `Navigator.of(context).pop()`) memerlukan `BuildContext` untuk mengetahui dari mana navigasi tersebut berasal dan kemana tujuannya.
3.  **Media Queries:** Untuk mendapatkan informasi tentang ukuran layar, *pixel ratio*, orientasi perangkat, dll., dapat menggunakan `MediaQuery.of(context)`.
4.  **Internationalization/Localization:** Untuk mengakses data terjemahan, seringkali menggunakan `AppLocalizations.of(context)`.
5.  **InheritedWidget:** `BuildContext` adalah kunci untuk menggunakan `InheritedWidget`, sebuah mekanisme yang sangat efisien untuk meneruskan data ke bawah Widget Tree tanpa harus meneruskannya melalui setiap konstruktor.

**Bagaimana Penggunaannya di Metode `build`?**
Setiap metode `build` dari `StatelessWidget` dan `StatefulWidget` menerima `BuildContext` sebagai argumen:
```
  // This widget is the root of your application. (ada pada main.dart)
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Shot On Target Market',
      theme: ThemeData(
        // This is the theme of your application.
        ...
```
Dalam contoh di atas, `context` digunakan untuk mengakses tema aplikasi.
## ***Konsep "Hot Reload" di Flutter dan Perbedaan dengan "Hot Restart***
**Hot Reload** adalah fitur yang memungkinkan untuk menyuntikkan perubahan kode yang dibuat langsung ke aplikasi yang sedang berjalan **tanpa kehilangan state aplikasi saat ini**.<br>**Cara Kerjanya:**
1.  Membuat perubahan pada kode Dart (misalnya, mengubah teks, warna, atau menambahkan widget baru).
2.  Menyimpan file atau menekan tombol Hot Reload di IDE.
3.  Mesin Dart Flutter dengan cepat mengkompilasi ulang hanya kode yang telah berubah.
4.  Kode yang telah dikompilasi diinjeksi ke dalam Dart Virtual Machine (VM) yang sedang berjalan di perangkat atau emulator.
5.  Flutter secara otomatis membangun ulang Widget Tree, menerapkan perubahan UI, tetapi **mempertahankan state aplikasi sebelumnya**.

**Manfaat Hot Reload:**
*   **Iterasi Cepat:** dapat dilihat efek perubahan kode hampir secara instan (biasanya dalam milidetik atau beberapa detik).
*   **Pertahankan State:** Ini adalah keuntungan terbesar. Jika sedang berada di halaman ketiga aplikasi dengan formulir yang sudah terisi sebagian, Hot Reload akan memungkinkan untuk melihat perubahan UI tanpa harus mengisi ulang formulir atau menavigasi kembali ke halaman tersebut. Ini sangat meningkatkan produktivitas saat mengembangkan UI.

**Hot Restart** adalah proses yang lebih lengkap dibandingkan Hot Reload. Ketika melakukan Hot Restart, seluruh aplikasi Flutter akan dimulai ulang dari awal.<br>**Cara Kerjanya:**
1.  Membuat perubahan pada kode Dart.
2.  Menekan tombol Hot Restart di IDE.
3.  Seluruh Dart VM yang menjalankan aplikasi di perangkat atau emulator akan dihentikan dan kemudian dimulai ulang dari awal.
4.  Seluruh kode aplikasi akan dikompilasi ulang dan dieksekusi dari fungsi `main()`.

**Manfaat Hot Restart:**
*   **Pembaruan State Global:** Hot Restart berguna ketika membuat perubahan yang memengaruhi *state* global atau inisialisasi aplikasi (misalnya, perubahan pada metode `main()`, *initial state* dari `StatefulWidget` yang dibuat di awal aplikasi, atau konfigurasi *plugin* yang memerlukan inisialisasi awal).
*   **Memecahkan Masalah State:** Kadang-kadang, Hot Reload dapat meninggalkan *state* yang tidak konsisten jika perubahan kode sangat mendasar dan tidak kompatibel dengan *state* yang ada. Dalam kasus seperti ini, Hot Restart akan membersihkan semua *state* dan memulai ulang dengan *state* yang baru.

**Perbedaan Utama Antara Hot Reload dan Hot Restart:**
| Fitur              | Hot Reload                                   | Hot Restart                                   |
| :----------------- | :------------------------------------------- | :-------------------------------------------- |
| **Kecepatan**      | Sangat cepat (milidetik/beberapa detik)      | Lebih lambat (beberapa detik)                 |
| **Pertahankan State** | **Mempertahankan state aplikasi**            | **Mengatur ulang semua state aplikasi**       |
| **Lingkup Perubahan** | Perubahan kode UI, logika fungsi, dll.       | Perubahan pada `main()`, state awal `StatefulWidget`, inisialisasi plugin, dll. |
| **Eksekusi**       | Menyuntikkan kode baru ke VM yang berjalan   | Menghentikan dan memulai ulang seluruh VM    |
| **Tujuan Umum**    | Iterasi cepat UI dan logika *frontend*      | Pembaruan pada *state* global atau masalah *state* yang kompleks |

**Kapan Menggunakan Masing-masing:**

*   **Hot Reload:** Hampir setiap saat membuat perubahan pada UI, logika, atau fungsionalitas aplikasi dan ingin melihat hasilnya dengan cepat tanpa kehilangan posisi atau data input. Ini adalah *default* yang paling sering digunakan.
*   **Hot Restart:**
    *   Ketika Hot Reload tidak menampilkan perubahan yang diharapkan.
    *   Ketika mengubah `main()` fungsi.
    *   Ketika mengubah *initial state* dari sebuah `StatefulWidget` yang sudah dibuat dan ingin melihat efeknya dari awal.
    *   Ketika menambah atau mengubah *dependencies* paket.
    *   Ketika merasa *state* aplikasi menjadi tidak konsisten setelah beberapa kali Hot Reload.


# <p align="center">**TUGAS 8**</p>
## Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter
`Navigator` adalah widget yang mengelola tumpukan (stack) halaman atau rute di aplikasi Flutter. Ketika berpindah dari satu halaman ke halaman lain, sebenarnya memanipulasi stack tersebut. Dua metode umum untuk navigasi adalah `push()` dan `pushReplacement()`.

**`Navigator.push()`**
*   **Fungsi:** Menambahkan rute baru ke bagian atas tumpukan navigasi.
*   **Perilaku:** Halaman sebelumnya **tetap ada** di tumpukan dan menjadi rute di bawah halaman yang baru. User dapat kembali ke halaman sebelumnya menggunakan tombol kembali perangkat atau `Navigator.pop(context)`.
*   **Ilustrasi:**
    `[Halaman A]` -> `Navigator.push(Halaman B)` -> `[Halaman A, Halaman B]`
    Ketika menekan tombol kembali dari Halaman B, akan kembali ke Halaman A.

**`Navigator.pushReplacement()`**
*   **Fungsi:** Mengganti rute teratas di tumpukan navigasi dengan rute baru.
*   **Perilaku:** Halaman sebelumnya **dihapus** dari tumpukan dan digantikan oleh halaman yang baru. Ini berarti User **tidak dapat** kembali ke halaman yang diganti menggunakan tombol kembali perangkat.
*   **Ilustrasi:**
    `[Halaman A]` -> `Navigator.pushReplacement(Halaman B)` -> `[Halaman B]`
    Ketika menekan tombol kembali dari Halaman B, aplikasi akan keluar (jika Halaman B adalah satu-satunya di tumpukan) atau kembali ke rute yang *sebelum* Halaman A.<br><br>
***Penggunaan :***<br><br>
**`Navigator.push()` (Untuk menambah halaman ke tumpukan dan bisa kembali):**
*   **Form Produk:** dari *homepage*, ketika user ingin menambahkan produk baru atau mengubah produk yang ada, aplikasi menampilkan `ProductFormPage`
*   **Detail Produk:** Dari daftar produk (misalnya, `ProductListPage`), ketika user menekan salah satu produk untuk melihat detailnya (`ProductDetailPage`). User diharapkan dapat kembali ke daftar produk setelah melihat detailnya.
*   **Halaman Pengaturan:** Dari *homepage*, ketika user membuka halaman pengaturan (`SettingsPage`). User pasti ingin kembali ke `Homepage` setelah selesai mengatur.
*   **Proses Checkout Bertahap:** Jika proses *checkout* memiliki beberapa langkah (misalnya, `ShippingAddressPage` -> `PaymentMethodPage` -> `OrderSummaryPage`). user mungkin ingin kembali ke langkah sebelumnya untuk mengubah informasi.

**`Navigator.pushReplacement()` (Untuk mengganti halaman, biasanya di momen penting):**
*   **Setelah Login Berhasil:** Setelah user berhasil *login* (`LoginPage`), user tidak perlu kembali ke halaman *login* dengan menekan tombol kembali. Langsung ganti `LoginPage` dengan `Homepage`.
*   **Setelah Register Berhasil:** Mirip dengan *login*, setelah register (`RegisterPage`) selesai, ganti dengan halaman utama atau halaman profil.
*   **Reset Password Sukses:** Setelah user berhasil mengatur ulang kata sandi baru, selanjutnya mengganti halaman *reset password* dengan halaman *login* lagi.

## Memanfaatkan Hierarchy Widget Seperti `Scaffold`, `AppBar`, dan `Drawer` untuk Membangun Struktur Halaman yang Konsisten
`Scaffold`, `AppBar`, dan `Drawer` adalah widget kunci dalam Flutter yang mengikuti pedoman Material Design untuk struktur aplikasi.<br><br>**`Scaffold` sebagai Fondasi Setiap Halaman:**
*   **Fungsi:** `Scaffold` adalah kerangka dasar untuk setiap layar atau halaman di aplikasi Material Design. Ini menyediakan slot-slot standar untuk elemen UI utama.
*   **Pemanfaatan di Shot On Target Market:**
    *   **Setiap Halaman Memiliki `Scaffold`:** Setiap "layar" utama aplikasi Anda (misalnya, `HomePage`, `ProductFirmPage`, `ProductPage`, dan lain-lain) harus dibungkus dalam sebuah `Scaffold`. Ini memastikan setiap halaman memiliki struktur dasar yang sama.
    *   **Konsistensi Visual:** Dengan menggunakan `Scaffold`, secara otomatis mendapatkan perilaku Material Design seperti kemampuan untuk menampilkan *snackbar*, *bottom sheet*, *floating action button*, dan integrasi dengan tema aplikasi. Ini menciptakan tampilan yang seragam dan konsisten.

**`AppBar` untuk Navigasi dan Branding di Setiap Halaman:**
*   **Fungsi:** `AppBar` adalah bilah atas di `Scaffold` yang berfungsi sebagai penunjuk lokasi user, judul halaman, dan tempat untuk tombol navigasi atau aksi.
*   **Pemanfaatan di Shot On Target Market:**
    *   **Judul Halaman yang Jelas:** Setiap `AppBar` dapat menampilkan judul halaman yang relevan (misalnya, `Create New Product`). Ini membantu user memahami di mana user berada.
    *   **Tombol Kembali Otomatis:** Ketika `push()` halaman baru, `AppBar` secara otomatis akan menampilkan tombol kembali di sebelah kiri judul, yang sangat penting untuk navigasi intuitif.
    *   **Icon Menu Drawer:** Di halaman utama (`HomePage`), `AppBar` secara otomatis akan menampilkan ikon hamburger (menu) di sebelah kiri jika `drawer` disediakan di `Scaffold`.

**`Drawer` untuk Navigasi Global dan Fungsionalitas Sekunder:**
*   **Fungsi:** `Drawer` adalah panel navigasi yang meluncur keluar dari samping layar (biasanya kiri) yang berisi daftar link ke tujuan utama aplikasi.
*   **Pemanfaatan di Shot On Target Market:**
    *   **Navigasi Utama:** `Drawer` adalah tempat ideal untuk menempatkan link ke halaman-halaman utama seperti "Home", "All Products", "Create Product", dan lain-lain. Ini menyediakan *entry point* yang konsisten untuk navigasi tingkat atas di seluruh aplikasi.
    *   **Informasi :** dapat menambahkan header di `Drawer` yang menampilkan informasi, misalnya judul dan tagline atau profil user.
    *   **Mengurangi Kekacauan AppBar:** Dengan memindahkan banyak link navigasi ke `Drawer`, `AppBar` dapat tetap bersih dan fokus pada judul halaman dan aksi-aksi utama yang sangat penting.
    *   **Aksesibilitas Konsisten:** Di halaman manapun yang memiliki `Scaffold` dengan `drawer` yang diatur, pengguna dapat menggeser dari tepi layar atau mengetuk ikon menu di `AppBar` untuk mengakses navigasi global.

## Kelebihan Layout Widget Seperti `Padding`, `SingleChildScrollView`, dan `ListView` 

Ketika membangun formulir (form) di aplikasi Shot On Target Market, penggunaan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` sangat penting untuk menciptakan antarmuka yang ramah pengguna, mudah dibaca, dan adaptif.<br><br>**Kelebihan `Padding`:** 
*   **Keterbacaan dan Estetika:** `Padding` menambahkan ruang kosong di sekeliling widget anaknya. Ini sangat penting untuk formulir agar elemen-elemen input tidak terlihat terlalu padat dan menempel satu sama lain atau ke tepi layar. Ruang kosong meningkatkan keterbacaan dan membuat antarmuka terlihat lebih rapi dan profesional.
*   **Area Sentuh yang Jelas:** Dengan *padding*, setiap *input field* atau tombol memiliki "ruang bernapas" di sekelilingnya, membuat area sentuh lebih jelas dan mengurangi kesalahan sentuhan.
*   **Konsistensi Visual:** `Padding` dapat mengset nilai yang konsisten untuk semua elemen formulir, menciptakan tata letak yang seragam.<br><br>
**Contoh Penggunaan**
```dart
// Bagian dari new_product_form.dart (line: 50)
...
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          // === Title ===
          Padding(                        // <<<<<<<<<<<<<<<<<
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Title",
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              ...
            ),
          ),
          // === Price ===
          Padding(                        // <<<<<<<<<<<<<<<<<
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Price",
                labelText: "Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              ...
            ),
          ),
          ...
        ]
    )
  ...
```
**Kelebihan `SingleChildScrollView`:**
*   **Mengatasi Overflow Layar (Keyboard Overlay):** Ini adalah kelebihan terbesar. Formulir seringkali memiliki banyak *input field*. Ketika *keyboard* virtual muncul, ia dapat menutupi bagian bawah formulir. `SingleChildScrollView` memastikan bahwa seluruh konten formulir dapat digulir, sehingga pengguna selalu dapat mengakses *input field* yang sedang mereka edit atau tombol *submit*.
*   **Adaptasi Ukuran Layar:** Memungkinkan formulir berfungsi dengan baik di berbagai ukuran layar dan orientasi (potret/landscape) tanpa khawatir konten akan terpotong.
*   **Sederhana untuk Formulir Pendek:** Jika formulir tidak terlalu panjang dan hanya perlu digulir sesekali (misalnya, saat keyboard muncul), `SingleChildScrollView` adalah solusi yang sederhana dan ringan.<br><br>
**Contoh Penggunaan :**

```dart
// Bagian dari new_product_form.dart (line: 299)
...
  return AlertDialog(
      title: const Text('New Product Created'),
      content: SingleChildScrollView(                        // <<<<<<<<<<<<<<<<<
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text('Title: $_title'),
            Text('Price: $_price'),
            Text('Description: $_description'),
            Text('Category: $_category'),
            Text('Thumbnail: $_thumbnailUrl'),
            Text(
                'Is Featured: ${_isFeatured ? "Yes" : "No"}'),
            Text('Stock: $_stock'),
            Text(
                'Purchased Quantity: $_quantityPurchased'),
          ],
        ),
      ),
      ...
    )
...
```
**Kelebihan `ListView`:**
*   **Efisiensi Rendering (Lazy Loading):** Untuk formulir yang sangat panjang atau daftar *input field* yang dihasilkan secara dinamis (misalnya, daftar item pesanan yang dapat diubah kuantitasnya), `ListView` adalah pilihan yang lebih efisien daripada `SingleChildScrollView` + `Column`. `ListView` hanya merender item yang terlihat di layar, menghemat sumber daya sistem.
*   **Penanganan Daftar Dinamis:** Ideal untuk skenario di mana jumlah elemen formulir bisa bervariasi (misalnya, menambahkan atau menghapus item dari keranjang belanja yang juga berfungsi sebagai bagian dari formulir *checkout*).
*   **Built-in Scrolling:** Seperti `SingleChildScrollView`, `ListView` juga memiliki kemampuan *scrolling* bawaan.<br><br>
**Contoh Penggunaan**
```dart
// Bagian dari left_drawer.dart (line: 10)
...
  return Drawer(
    child: ListView(                        // <<<<<<<<<<<<<<<<<
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            children: [
              Text(
                'Shot On Target Market',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text("Your One-Stop Market, Always on Target!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.all_inbox),
          title: const Text('Home'),
          // Bagian redirection ke MyHomePage
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },
        ),
        ...
      ]
    )
  );
...
```
## Penyesuaian Warna Tema Agar Memiliki Identitas Visual yang Konsisten dengan Brand
Menyesuaikan warna tema adalah langkah krusial untuk memberikan aplikasi identitas visual yang kuat dan konsisten dengan *brand*. Ini dilakukan melalui widget `ThemeData` yang disediakan oleh `MaterialApp`.<br><br>Langkah-langkah dan contoh penerapannya:
1. **Mendefinisikan Warna Utama:** mengidentifikasi warna-warna utama yang mewakili *brand*. Misalnya:
*   **Warna Primer:** Mungkin warna dominan pada logo/ tema.
*   **Warna Sekunder:** Warna aksen atau pelengkap.
*   **Warna Latar Belakang:** Warna dasar UI.
*   **Warna Teks:** Untuk teks gelap dan terang.
*   **Warna Error/Peringatan:** (misalnya, merah untuk pesan error).

2. **Menggunakan `ThemeData` di `MaterialApp`:** semua penyesuaian tema utama dilakukan melalui properti `theme` pada `MaterialApp`.
```dart
// main.dart
...
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shot On Target Market',
      theme: ThemeData(
        ...
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
```
**Manfaat Konsistensi Visual:**

*   **Pengenalan Brand:** User akan segera mengasosiasikan warna-warna ini dengan aplikasi dan platform.
*   **Pengalaman Pengguna yang Lebih Baik:** UI yang konsisten lebih mudah dipahami dan digunakan. Pengguna tidak perlu beradaptasi dengan gaya yang berbeda di setiap halaman.
*   **Profesionalisme:** Aplikasi terlihat lebih terpoles dan profesional.
*   **Efisiensi Pengembangan:** Dengan mengatur tema secara global, tidak perlu mengatur warna atau gaya satu per satu di setiap widget, menghemat waktu dan mengurangi potensi kesalahan.


# <p align="center">**TUGAS 9**</p>
## ***Pentingnya Model Dart untuk Data JSON***

Saat berinteraksi dengan API, data sering kali dipertukarkan dalam format JSON (*JavaScript Object Notation*). Meskipun Dart dapat merepresentasikan JSON secara langsung menggunakan `Map<String, dynamic>`, pendekatan ini memiliki beberapa kelemahan signifikan. Di sinilah **Model Dart** berperan.

**Mengapa perlu membuat Model Dart?**

Model Dart adalah sebuah *class* di Dart yang merepresentasikan struktur data dari JSON. Daripada bekerja dengan `Map` yang generik, kita dapat membuat *class* dengan properti-properti yang namanya sesuai dengan *key* di dalam JSON, dan tipe datanya sesuai dengan tipe nilai (*value*) dari JSON tersebut.

**Contoh Sederhana:**

Misalkan data JSON pengguna seperti ini dari API:

```json
{
    "name": "Jersey Real Madrid KW",
    "price": 1200000,
    "description": "Test ada yang beli kah?",
    "thumbnail": "https://www.adidas.co.id/media/catalog/product/cache/a2326ed7dcde4da57fee4197e095ea73/j/v/jv5918_1_apparel_photography_front_center_view_grey.jpg",
    "category": "team_kit",
    "is_featured": false,
    "stock": 10,
    "quantity_purchased": 0,
    "user_id": 1
},
```

**Tanpa Model (Langsung menggunakan `Map<String, dynamic>`):**

```dart
Map<String, dynamic> user = jsonDecode(response.body);
print(user['name']); // Mengakses data
user['isActive'] = false; // Memanipulasi data
```

**Konsekuensi Jika Langsung Menggunakan `Map<String, dynamic>` Tanpa Model:**

1.  **Terkait Validasi Tipe (*Type Safety*):**
    *   **Tanpa Model:** akan kehilangan jaminan tipe data. Saat mengakses `user['name']`, Dart hanya tahu itu adalah `dynamic`. Kita bisa saja salah mengasumsikan tipenya. Misalnya, jika kita mengharapkan `int` tapi ternyata `String`, ini bisa menyebabkan *runtime error* (kesalahan saat aplikasi berjalan).
    *   **Dengan Model:** Properti `user.name` sudah didefinisikan sebagai `String`. Jika data dari server tidak sesuai (misalnya `null` atau `int`), proses *parsing* di `User.fromJson` akan langsung gagal, sehingga kesalahan bisa dideteksi lebih awal (*fail-fast principle*). Selain itu, IDE seperti VS Code akan memberikan *autocomplete* dan pengecekan tipe saat *coding*, meminimalisir kesalahan pengetikan.

2.  **Terkait *Null-Safety*:**
    *   **Tanpa Model:** `Map` bisa saja tidak berisi *key* yang kita harapkan. Mengakses `user['age']` padahal *key* `age` tidak ada di JSON akan menghasilkan `null`. Jika kita tidak menanganinya dengan benar, ini akan menyebabkan `NullPointerException`. Kita harus selalu melakukan pengecekan seperti `if (user.containsKey('age'))`.
    *   **Dengan Model:** bisa didefinisikan properti sebagai *nullable* (misal: `String? address`) atau non-nullable (`String name`). Jika properti non-nullable tidak ada di JSON, *factory constructor* akan memberikan peringatan atau kesalahan, memaksa kita untuk menangani kasus tersebut, misalnya dengan memberikan nilai *default*. Ini membuat kode kita lebih robust dan sesuai dengan prinsip *null-safety* Dart.

3.  **Terkait *Maintainability* (Kemudahan Perawatan Kode):**
    *   **Tanpa Model:** Jika struktur JSON berubah (misalnya, *key* `name` diubah menjadi `fullName`), kita harus mencari dan mengganti semua penggunaan `user['name']` di seluruh kode kita. Ini sangat rentan terhadap kesalahan (*error-prone*).
    *   **Dengan Model:** kita hanya perlu mengubahnya di satu tempat: di dalam *class* `User`. Cukup mengubah properti `name` menjadi `fullName` dan memperbarui logikanya di `fromJson` dan `toJson`. Semua bagian lain dari kode yang menggunakan `user.name` akan langsung menunjukkan kesalahan kompilasi (*compile-time error*), sehingga kita mengetahui di mana saja yang perlu diperbaiki. Ini membuat kode lebih mudah dipelihara dan diskalakan.


## ***Fungsi `package:http` dan `CookieRequest`***

Dalam konteks komunikasi Flutter dengan *backend* seperti Django, kedua *package* ini memegang peran penting namun berbeda dalam manajemen permintaan HTTP.<br><br>
**Fungsi dan Peran `package:http`:**
*   **Fungsi Utama:** `http` adalah *package* fundamental di Dart untuk membuat permintaan HTTP (*HTTP requests*) ke sebuah server. Ini adalah alat dasar untuk berkomunikasi melalui jaringan.
*   **Peran:** `http` menyediakan fungsi-fungsi level atas yang sederhana untuk berbagai metode HTTP seperti `http.get()`, `http.post()`, `http.put()`, dan `http.delete()`. Paket ini menangani detail-detail teknis seperti membuka koneksi, mengirim *headers* dan *body*, serta menerima respons dari server. Namun, secara *default*, `http` bersifat *stateless*. Artinya, setiap permintaan (`http.get`, `http.post`) adalah independen dan tidak secara otomatis mempertahankan sesi atau *cookie* dari permintaan sebelumnya.

**Fungsi dan Peran `CookieRequest`:**
*   **Fungsi Utama:** `CookieRequest` bertujuan untuk mengatasi sifat *stateless* dari `http`. Tujuannya adalah untuk secara otomatis **mengelola dan mempertahankan *cookie* sesi** di antara beberapa permintaan HTTP.
*   **Peran:** Saat melakukan *login*, server (Django) biasanya akan mengirimkan kembali sebuah *cookie* sesi (misalnya `sessionid`). *Cookie* ini berfungsi sebagai "tiket" yang membuktikan bahwa user sudah terautentikasi. Untuk permintaan selanjutnya (misalnya mengambil data profil), haruslah menyertakan kembali *cookie* ini.
    *   **`http` Saja:** dilakukan secara manual mengekstrak *cookie* dari respons *login* dan menambahkannya ke *header* setiap permintaan berikutnya. Ini merepotkan dan rawan kesalahan.
    *   **`CookieRequest`:** Ia bertindak sebagai "pembungkus" (*wrapper*) atau klien HTTP yang lebih canggih. Ia secara otomatis akan:
        1.  Menyimpan *cookie* yang diterima dari respons server.
        2.  Melampirkan *cookie* yang tersimpan tersebut ke setiap permintaan selanjutnya yang dikirim ke domain yang sama.

**Perbedaan Kunci:**

| Aspek | `package:http` | `CookieRequest`|
| --- | --- | --- |
| **Sifat** | *Stateless* | *Stateful* (mempertahankan state sesi) |
| **Manajemen Cookie** | Manual (harus diekstrak dan ditambahkan sendiri) | Otomatis (menyimpan dan melampirkan cookie) |
| **Konteks Penggunaan** | Baik untuk permintaan tunggal atau API yang tidak memerlukan sesi (misal: API publik). | Esensial untuk aplikasi yang memerlukan autentikasi berbasis sesi (login, logout). |

---

## ***Pentingnya Berbagi Satu Instance `CookieRequest`***
Membagikan satu (*singleton*) *instance* dari `CookieRequest` ke semua komponen di aplikasi Flutter adalah praktik krusial untuk menjaga konsistensi sesi autentikasi.<br><br>
**Mengapa Perlu Dibagikan?**
```
Bayangkan `CookieRequest` sebagai sebuah "dompet" tempat kita menyimpan kunci (*cookie* sesi) untuk masuk ke sebuah gedung (*backend* server).
```
1.  **Konsistensi Sesi:** Saat pengguna berhasil *login* melalui `LoginPage`, `CookieRequest` menerima dan menyimpan *cookie* `sessionid`. Jika kemudian pengguna pindah ke `HomePage` dan `HomePage` membuat *instance* `CookieRequest` yang baru, "dompet" yang baru ini akan kosong. Permintaan data dari `HomePage` tidak akan menyertakan *cookie* sesi, sehingga server Django akan menganggapnya sebagai pengguna anonim dan menolak akses.

2.  **Satu Sumber Kebenaran (*Single Source of Truth*):** Dengan memiliki satu *instance* global, semua bagian aplikasi—baik itu halaman profil, halaman pengaturan, atau halaman produk—akan menggunakan "dompet" yang sama. Jika pengguna *logout*, *cookie* akan dihapus dari *instance* tunggal ini, dan secara otomatis semua komponen lain tidak lagi memiliki akses terautentikasi. Ini mencegah kondisi di mana satu halaman masih "merasa" *login* sementara yang lain sudah *logout*.

3.  **Efisiensi Sumber Daya:** Membuat objek klien HTTP berulang kali bisa jadi tidak efisien. Meskipun tidak signifikan untuk aplikasi kecil, menggunakan satu *instance* memastikan bahwa konfigurasi dan koneksi yang mendasarinya dapat digunakan kembali.

**Bagaimana Cara Membagikannya?**
Biasanya dilakukan menggunakan pola manajemen state atau *dependency injection*, seperti:
*   **Provider:** Membuat `Provider` untuk `CookieRequest` di level teratas aplikasi (di atas `MaterialApp`), sehingga semua *widget* di bawahnya bisa mengakses *instance* yang sama.
*   **GetIt:** Mendaftarkan `CookieRequest` sebagai *singleton* di *service locator*.
*   **Singleton Pattern:** Membuat *class* dengan *factory constructor* yang selalu mengembalikan *instance* yang sama.

## ***Konfigurasi Konektivitas Flutter dengan Django***
Agar aplikasi Flutter (klien) dapat berkomunikasi dengan *backend* Django (server) yang berjalan di mesin pengembangan yang sama, beberapa konfigurasi jaringan dan keamanan perlu diatur.

1.  **Menambahkan `10.0.2.2` pada `ALLOWED_HOSTS` di Django:**
    *   **Mengapa?** Saat menjalankan aplikasi Flutter di emulator Android, emulator tersebut berjalan di dalam mesin virtualnya sendiri dengan jaringan internal. Dari sudut pandang emulator, `localhost` atau `127.0.0.1` merujuk pada *dirinya sendiri*, bukan ke mesin *host* (laptop/PC) tempat server Django berjalan. Android menyediakan alamat IP alias `10.0.2.2` yang secara khusus berfungsi sebagai jembatan dari emulator ke `localhost` mesin *host*.
    *   **Apa yang terjadi jika tidak dilakukan?** Django memiliki mekanisme keamanan untuk hanya menerima permintaan dari *host* yang terdaftar di `ALLOWED_HOSTS` dalam `settings.py`. Jika `10.0.2.2` tidak ditambahkan, saat Flutter dari emulator mencoba mengakses Django, Django akan melihat permintaan itu datang dari `10.0.2.2`. Karena alamat ini tidak diizinkan, Django akan menolak permintaan tersebut dengan respons **HTTP 400 Bad Request**.

2.  **Mengaktifkan CORS (*Cross-Origin Resource Sharing*):**
    *   **Mengapa?** Browser (dan juga *engine* di balik Flutter) menerapkan *Same-Origin Policy* sebagai mekanisme keamanan. Kebijakan ini mencegah sebuah halaman web (atau aplikasi) membuat permintaan ke domain yang berbeda dari domain asalnya. Aplikasi Flutter berjalan di "origin" yang berbeda dari server Django. CORS adalah mekanisme yang memungkinkan server (Django) untuk memberitahu *browser* bahwa permintaan dari *origin* lain (Flutter) diizinkan. Ini biasanya dilakukan dengan menggunakan *package* seperti `django-cors-headers`.
    *   **Apa yang terjadi jika tidak dilakukan?** Aplikasi Flutter akan mengalami **CORS error**. Permintaan mungkin berhasil dikirim, tetapi *browser/engine* akan memblokir respons dari server, sehingga dari sisi Flutter seolah-olah permintaan tersebut gagal. User akan melihat pesan kesalahan terkait CORS di konsol *debug*.

3.  **Pengaturan `SameSite` untuk Cookie:**
    *   **Mengapa?** Atribut `SameSite` pada *cookie* adalah fitur keamanan untuk mencegah serangan *Cross-Site Request Forgery* (CSRF). Pengaturan `SameSite='None'` diperlukan dalam konteks pengembangan *cross-origin* (Flutter ke Django) agar *browser/engine* mau mengirimkan *cookie* pada permintaan lintas domain. Namun, `SameSite='None'` juga **mewajibkan** atribut `Secure` (yang berarti *cookie* hanya akan dikirim melalui koneksi HTTPS).
    *   **Apa yang terjadi jika tidak dilakukan dengan benar?** Jika `SameSite` tidak diatur ke `None` untuk skenario *cross-origin*, *browser/engine* tidak akan mengirimkan *cookie* sesi pada permintaan berikutnya setelah *login*. Akibatnya, Django akan selalu menganggap pengguna belum terautentikasi.

4.  **Menambahkan Izin Akses Internet di Android:**
    *   **Mengapa?** Secara *default*, untuk alasan keamanan, aplikasi Android tidak diizinkan untuk mengakses jaringan internet. User harus secara eksplisit meminta izin ini.
    *   **Apa yang terjadi jika tidak dilakukan?** perlu menambahkan baris `<uses-permission android:name="android.permission.INTERNET" />` di dalam file `AndroidManifest.xml`. Tanpa izin ini, sistem operasi Android akan memblokir semua upaya aplikasi Flutter Anda untuk membuat koneksi jaringan. Aplikasi tidak akan bisa berkomunikasi dengan server Django sama sekali, dan biasanya akan menghasilkan *exception* terkait jaringan atau koneksi.

## ***Mekanisme Pengiriman Data***
Berikut adalah alur data dari input pengguna hingga ditampilkan kembali di layar:
1.  **Input Pengguna (UI Layer):**
    *   Pengguna mengetik data pada sebuah `TextField` dalam sebuah *form* di Flutter.
    *   State dari `TextField` dikelola, misalnya menggunakan `TextEditingController`.
    *   Saat pengguna menekan tombol "Submit", sebuah fungsi (*event handler*) dipanggil.

2.  **Persiapan Data (Logic/State Management Layer):**
    *   Fungsi yang dipanggil tadi akan mengambil data dari `TextEditingController`.
    *   Data ini kemudian dikonversi menjadi sebuah **Model Dart**. Misalkan, data dari form registrasi dibuat menjadi `instance` dari `class RegisterData`.
    *   `instance` model ini diubah menjadi format JSON menggunakan method `.toJson()`. Hasilnya adalah `Map<String, dynamic>`.

3.  **Pengiriman Data (Service/Repository Layer):**
    *   Sebuah layanan (*service*) yang bertanggung jawab untuk komunikasi HTTP dipanggil.
    *   Layanan ini menggunakan `CookieRequest` (atau `http`) untuk membuat permintaan `POST` ke *endpoint* Django yang sesuai (misal: `/api/register/`).
    *   `Map` JSON tadi di-*encode* menjadi *string* JSON dan dikirim sebagai *body* dari permintaan. *Header* `Content-Type` diatur ke `application/json`.

4.  **Proses di Backend (Django):**
    *   Django menerima permintaan `POST`.
    *   *Framework* Django (seperti Django REST Framework) akan mem-*parse* *body* JSON menjadi struktur data Python (misalnya, *dictionary*).
    *   Data divalidasi menggunakan *Serializer*.
    *   Jika valid, data diproses oleh *view* Django (misalnya, membuat pengguna baru di *database*).
    *   Django kemudian mengirimkan respons balik, biasanya dalam format JSON, yang berisi status keberhasilan atau kegagalan, dan mungkin data yang baru dibuat.

5.  **Penerimaan dan Parsing Respons (Flutter):**
    *   Aplikasi Flutter menunggu (`await`) hingga respons diterima dari Django.
    *   Flutter memeriksa *status code* dari respons (misalnya, `201 Created` untuk sukses, `400 Bad Request` untuk error validasi).
    *   Jika sukses, *body* respons yang berupa *string* JSON di-*decode* menjadi `Map<String, dynamic>`.
    *   `Map` ini kemudian diubah menjadi **Model Dart** yang relevan (misal: `User`) menggunakan *factory constructor* `.fromJson()`.

6.  **Pembaruan State dan Tampilan (UI Layer):**
    *   *Instance* model yang baru diterima digunakan untuk memperbarui *state* aplikasi (misalnya, menggunakan `setState`, `Provider`, atau `Bloc`).
    *   Perubahan *state* ini akan memicu Flutter untuk me-*rebuild* UI.
    *   Data dari model (misal: `user.name`) kini ditampilkan di layar, misalnya dalam sebuah `Text` *widget* di halaman profil.

## ***Mekanisme Autentikasi (Login, Register, Logout)***
Alur autentikasi ini sangat bergantung pada komunikasi yang *stateful* yang dimediasi oleh *cookie* sesi.<br><br>
**Register:**
1.  **Flutter (Input):** Pengguna mengisi *form* registrasi (username, email, password) di aplikasi Flutter.
2.  **Flutter (Pengiriman):** Saat tombol "Register" ditekan:
    *   Data form diubah menjadi `Map` JSON.
    *   `CookieRequest.post()` mengirimkan data ini ke *endpoint* register Django (misal: `/api/register/`).
3.  **Django (Proses):**
    *   Menerima data, memvalidasinya.
    *   Jika valid, membuat objek `User` baru di *database*. Password di-*hash* sebelum disimpan (ini sangat penting untuk keamanan).
    *   Mengirim respons sukses (misal: HTTP `201 Created`) dengan pesan "Registrasi berhasil". Pada tahap ini, biasanya pengguna belum otomatis *login*.

**Login:**
1.  **Flutter (Input):** Pengguna memasukkan username dan password di halaman *login*.
2.  **Flutter (Pengiriman):**
    *   Data dikirim melalui `CookieRequest.post()` ke *endpoint* *login* Django (misal: `/api/login/`).
3.  **Django (Proses & Autentikasi):**
    *   Django menerima kredensial.
    *   Menggunakan sistem `django.contrib.auth`, Django memverifikasi apakah username ada dan apakah password yang diberikan cocok dengan *hash* yang tersimpan di *database*.
    *   Jika cocok, Django akan **membuat sebuah sesi baru** untuk pengguna tersebut di *database*-nya.
    *   Django kemudian mengirimkan respons sukses (HTTP `200 OK`). Yang paling penting, di dalam *header* respons ini, Django menyertakan `Set-Cookie` dengan `sessionid` yang unik untuk sesi tersebut.
4.  **Flutter (Penyimpanan Sesi):**
    *   `CookieRequest` secara otomatis mendeteksi *header* `Set-Cookie` dari respons Django.
    *   Ia akan **menyimpan *cookie* `sessionid`** ini secara internal.
5.  **Flutter (Navigasi):** Aplikasi mendeteksi login berhasil, lalu menavigasikan pengguna ke halaman utama atau *dashboard*.

**Akses Halaman Terproteksi (Setelah Login/ `@login_required`):**

1.  **Flutter (Permintaan):** Pengguna menavigasi ke halaman profil. Halaman ini memanggil fungsi untuk mengambil data profil, misalnya dengan `CookieRequest.get('/api/profile/')`.
2.  **Flutter (Otomatisasi Cookie):** `CookieRequest`, karena sudah menyimpan `sessionid`, secara otomatis akan **melampirkan *cookie* tersebut** ke dalam *header* permintaan `GET` ini.
3.  **Django (Verifikasi Sesi):**
    *   Django menerima permintaan ke `/api/profile/`.
    *   *Middleware* sesi Django melihat adanya *cookie* `sessionid`.
    *   Django menggunakan `sessionid` ini untuk mencari sesi yang cocok di *database*-nya, dan mengidentifikasi pengguna yang terkait dengan sesi tersebut.
    *   Karena pengguna teridentifikasi dan terautentikasi, Django melanjutkan untuk memproses permintaan, mengambil data profil dari *database*, dan mengirimkannya kembali sebagai respons JSON.
4.  **Flutter (Tampilan):** Flutter menerima data profil dan menampilkannya di UI.

**Logout:**
1.  **Flutter (Aksi):** Pengguna menekan tombol "Logout".
2.  **Flutter (Permintaan):** Aplikasi memanggil `CookieRequest.post('/api/logout/')`.
3.  **Django (Penghapusan Sesi):**
    *   *Endpoint logout* Django akan menghapus sesi pengguna dari *database* yang terkait dengan `sessionid` yang dikirimkan.
    *   Django mengirimkan respons sukses. Idealnya, Django juga mengirim *header* `Set-Cookie` yang "membersihkan" *cookie* `sessionid` di sisi klien (misalnya dengan mengatur masa kedaluwarsanya di masa lalu).
4.  **Flutter (Pembersihan Lokal & Navigasi):**
    *   `CookieRequest` akan menghapus *cookie* `sessionid` dari penyimpanannya.
    *   Aplikasi memperbarui *state*-nya menjadi "tidak terautentikasi" dan menavigasikan pengguna kembali ke halaman *login*. Setiap upaya akses ke halaman terproteksi setelah ini akan gagal karena `CookieRequest` tidak lagi memiliki *cookie* sesi untuk dikirim.

## ***Implementasi Step-by-Step***
1. Mengumpulkan niat. Dorongan saya mengerjakan tugas ini adalah karena saya punya tugas lain yang menumpuk.
2. Melanjutkan proses implementasi dengan membuat fitur login, register, dan logout. 
3. Masuk pada project Django kemarin dan membuat *new app* yaitu `authentication`.
4. Menambahkan aplikasi `authentication` pada `main/settings.py`.
5. Menginstall *Cross-Origin Resource Sharing* dan menambahkan `corsheaders.middleware.CorsMiddleware` pada middleware di `main/settings.py`.
6. Menambahkan port pada `ALLOWED_HOSTS` di `main/settings.py`
7. Membuat fungsi `login`, `register`, dan `logout`pada `authentication/views.py`. Serta melakukan routing pada `authentication/urls.py`, dan routing aplikasi pada `main/urls.py`.
8. Membuat fungsi `proxy_image`, `create_product_flutter`, dan `my_products_json_flutter` pada `main/views.py`. Dan melakukan routing pada masing-masing method di views pada `main/urls.py`.
9. Memastikan `show_json` akan memberikan data berbentuk json yang kita inginkan.
10. Setelah backend selesai, mulai membuat model dengan menyalin json dataa pada [Quicktype](https://app.quicktype.io/). Setelah itu memasukkannya pada `lib/models/product_entry.dart`.
11. Membuat 'login.dart' dan `register.dart` dan mencoba mengintegrasikan dengan web yang telah dibuat.
12. Membuat 'screens/product_entry_list.dart' yang mengambil data json melalui routing dari `json/`dan `my-products-json/` (sebagai filtering) dari web yang dibuat unruk menampilkan data.
13. Membuat `screens/product_detail.dart`untuk menampilkan data secara keseluruhan.
14. Membuat 'widgets/product_entry_card.dart' untuk membuat tampilan menyerupai card yang apabila ditekan akan menampilkan Product Detail.
15. Melakukan adjustment pada `screens/menu.dart`, `main.dart`, dan lain-lain sehingga antar widgets saling terintegrasi dan data terdelivery dengan baik.