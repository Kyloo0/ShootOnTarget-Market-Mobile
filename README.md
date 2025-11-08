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