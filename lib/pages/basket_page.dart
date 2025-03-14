import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Cart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const BasketPage(),
    );
  }
}

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final List<Map<String, String>> products = [
    {
      "name": "Sewa Hammock Parasut",
      "price": "Rp. 25.000/hari",
      "stock": "Tersedia: 10 pcs",
      "image": "hammock.jpg",
    },
    {
      "name": "Sewa Kompas Digital",
      "price": "Rp. 15.000/hari",
      "stock": "Tersedia: 12 pcs",
      "image": "digital_compass.jpg",
    },
    {
      "name": "Sewa Headlamp LED Rechargeable",
      "price": "Rp. 20.000/hari",
      "stock": "Tersedia: 20 pcs",
      "image": "headlamp.jpg",
    },
    {
      "name": "Sewa Meja Lipat Camping",
      "price": "Rp. 30.000/hari",
      "stock": "Tersedia: 8 pcs",
      "image": "folding_table.jpg",
    },
  ];

  final List<bool> selectedProducts = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Color(0xFF5A6A41),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount =
                constraints.maxWidth > 1200
                    ? 5
                    : constraints.maxWidth > 900
                    ? 4
                    : constraints.maxWidth > 600
                    ? 3
                    : 2;
            double childAspectRatio =
                (constraints.maxWidth / crossAxisCount) /
                (constraints.maxHeight / 2);

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Stack(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      shadowColor: Colors.black54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12.0),
                              ),
                              child: Image.asset(
                                product['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder:
                                    (context, error, stackTrace) => const Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product['name']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    product['price']!,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    product['stock']!,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedProducts[index] = !selectedProducts[index];
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              selectedProducts[index]
                                  ? Colors.green
                                  : Colors.white,
                          child: Icon(
                            selectedProducts[index]
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color:
                                selectedProducts[index]
                                    ? Colors.white
                                    : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed:
              selectedProducts.contains(true)
                  ? () {
                    // Tambahkan logika order di sini
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text(
            "ORDER NOW",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}