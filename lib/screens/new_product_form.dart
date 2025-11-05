import 'package:flutter/material.dart';
import 'package:shot_on_target_market/widgets/left_drawer.dart';

class NewProductForm extends StatefulWidget {
  const NewProductForm({super.key});

  @override
  State<NewProductForm> createState() => _NewProductFormState();
}

class _NewProductFormState extends State<NewProductForm> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  int? _price = 0;
  String _description = '';
  String _category = 'uncategorized';
  String _thumbnailUrl = '';
  bool _isFeatured = false;
  int? _stock = 0;
  int? _quantityPurchased = 0;

  final List<String> _categories = [
    'accessories',
    'tim_kit',
    'footwear',
    'protective_gear',
    'match_equipment',
    'training_equipment',
    'uncategorized',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Center(
              child: Text(
                'Create New Product',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          // TODO: Tambahkan drawer yang sudah dibuat di sini
          drawer: LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  // === Title ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Title",
                        labelText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _title = value!;
                        });
                      },
                      onSaved: (String? value) {
                        _title = value ?? '';
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Title cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Price ===
                  Padding(
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
                      onChanged: (String value) {
                        setState(() {
                          _price = int.tryParse(value);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Price cannot be empty!";
                        }
                        final number = int.tryParse(value);
                        if (number == null) {
                          return "Please enter a valid number!";
                        }
                        if (number <= 0) {
                          return "Price must be greater than zero!";
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _price = int.tryParse(value!);
                      },
                    ),
                  ),

                  // === Description ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Description cannot be empty!";
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _description = value ?? '';
                      },
                    ),
                  ),

                  // === Category ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: _category,
                      items: _categories.map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(
                                    cat[0].toUpperCase() + cat.substring(1)),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue!;
                        });
                      },
                    ),
                  ),

                  // === Thumbnail URL ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "URL Thumbnail (opsional)",
                        labelText: "URL Thumbnail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _thumbnailUrl = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Thumbnail cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Is Featured ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                      title: const Text("Mark as Featured"),
                      value: _isFeatured,
                      onChanged: (bool value) {
                        setState(() {
                          _isFeatured = value;
                        });
                      },
                    ),
                  ),

                  // === Stock ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Stock",
                        labelText: "Stock",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _stock = int.tryParse(value);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Stock cannot be empty!";
                        }
                        final number = int.tryParse(value);
                        if (number == null) {
                          return "Please enter a valid number!";
                        }
                        if (number <= 0) {
                          return "Stock must be greater than zero!";
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _stock = int.tryParse(value!);
                      },
                    ),
                  ),

                  // === Quantity Purchased ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Purchased Quantity",
                        labelText: "Purchased Quantity",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _quantityPurchased = int.tryParse(value);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Price cannot be empty!";
                        }
                        final number = int.tryParse(value);
                        if (number == null) {
                          return "Please enter a valid number!";
                        }
                        if (number <= 0) {
                          return "Price must be greater than zero!";
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _quantityPurchased = int.tryParse(value!);
                      },
                    ),
                  ),

                  // === Submit Button ===
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('New Product Created'),
                                  content: SingleChildScrollView(
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
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            _formKey.currentState!.reset();
                          }
                        },
                        child: const Text(
                          "Save Product",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

}