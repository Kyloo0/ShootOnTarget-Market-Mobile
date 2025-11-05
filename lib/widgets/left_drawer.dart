import 'package:flutter/material.dart';
import 'package:shot_on_target_market/screens/menu.dart';
import 'package:shot_on_target_market/screens/new_product_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
          // TODO: Bagian routing
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
          ListTile(
            leading: const Icon(Icons.add_circle_sharp),
            title: const Text('Create Products'),
            // Bagian redirection ke NewProductForm
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewProductForm(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('My Products'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(), // Ganti dengan halaman My Products
                  ));
            },
          ),
        ],
      ),
    );
  }
}