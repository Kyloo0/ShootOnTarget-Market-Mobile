import 'package:flutter/material.dart';
import 'package:shot_on_target_market/widgets/left_drawer.dart';
import 'package:shot_on_target_market/widgets/card_product.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Fitto Fadhelli Voltanie Ariyana";
  final String npm = "2406423401" ;
  final String kelas = "F" ;

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.all_inbox, Colors.blue),
    ItemHomepage("My Products", Icons.shopping_bag, Colors.green),
    ItemHomepage("Create Products", Icons.add_circle_sharp, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        // AppBar adalah bagian atas halaman yang menampilkan judul.
        appBar: AppBar(
          // Judul aplikasi "Football News" dengan teks putih dan tebal.
          title: const Text(
            'Shot On Target Market',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: LeftDrawer(),
        // Body halaman dengan padding di sekelilingnya.
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // Menyusun widget secara vertikal dalam sebuah kolom.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row untuk menampilkan 3 InfoCard secara horizontal.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),

              // Memberikan jarak vertikal 16 unit.
              const SizedBox(height: 16.0),

              // Menempatkan widget berikutnya di tengah halaman.
              Center(
                child: Column(
                  // Menyusun teks dan grid item secara vertikal.

                  children: [
                    // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Welcome to Shot On Target Market!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      // Agar grid menyesuaikan tinggi kontennya.
                      shrinkWrap: true,

                      // Menampilkan ItemCard untuk setiap item dalam list items.
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}
