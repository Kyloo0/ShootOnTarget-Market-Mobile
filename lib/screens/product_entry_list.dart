import 'package:flutter/material.dart';
import 'package:shot_on_target_market/models/product_entry.dart';
import 'package:shot_on_target_market/widgets/left_drawer.dart';
import 'package:shot_on_target_market/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:shot_on_target_market/screens/product_detail.dart';

enum ProductFilter { all, my }

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  ProductFilter selectedFilter = ProductFilter.all;
  late Future<List<ProductEntry>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts(context.read<CookieRequest>());
  }
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    String url;

    if (selectedFilter == ProductFilter.my) {
      url = 'http://localhost:8000/my-products-json/';
    } else {
      url = 'http://localhost:8000/json/';
    }

    final response = await request.get(url);
    List<ProductEntry> products = [];

    for (var d in response) {
      if (d != null) {
        products.add(ProductEntry.fromJson(d));
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          DropdownButton<ProductFilter>(  // Dropdown filter products
            value: selectedFilter,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: ProductFilter.all,
                child: Text("All Products"),
              ),
              DropdownMenuItem(
                value: ProductFilter.my,
                child: Text("My Products"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedFilter = value!;
                futureProducts = fetchProducts(request); // Refresh data
              });
            },
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no product in Shot On Target Market yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to news detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}