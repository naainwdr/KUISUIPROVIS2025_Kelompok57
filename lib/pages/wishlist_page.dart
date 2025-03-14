import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyWishlist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const WishlistPage(),
    );
  }
}

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        "name": "Sewa Tenda Dome Kapasitas 4 Orang",
        "price": "Rp. 75.000/hari",
        "stock": "Tersedia: 10 unit",
        "image": "tent.jpg",
      },
      {
        "name": "Sewa Sleeping Bag Hangat",
        "price": "Rp. 25.000/hari",
        "stock": "Tersedia: 15 pcs",
        "image": "sleeping_bag.jpg",
      },
      {
        "name": "Sewa Kompor Portable Mini",
        "price": "Rp. 18.000/hari",
        "stock": "Tersedia: 8 unit",
        "image": "portable_stove.png",
      },
      {
        "name": "Sewa Matras Lipat Camping",
        "price": "Rp. 9.000/hari",
        "stock": "Tersedia: 20 pcs",
        "image": "matras.jpg",
      },
      {
        "name": "Sewa Senter LED Tahan Air",
        "price": "Rp. 7.500/hari",
        "stock": "Tersedia: 25 pcs",
        "image": "flashlight.jpg",
      },
      {
        "name": "Sewa Tas Carrier 60L",
        "price": "Rp. 55.000/hari",
        "stock": "Tersedia: 12 unit",
        "image": "carrier_bag.jpg",
      },
      {
        "name": "Sewa Pisau Lipat Multifungsi",
        "price": "Rp. 12.000/hari",
        "stock": "Tersedia: 18 pcs",
        "image": "folding_knife.jpg",
      },
      {
        "name": "Sewa Trekking Pole Aluminium",
        "price": "Rp. 20.000/hari",
        "stock": "Tersedia: 14 pasang",
        "image": "trekking_pole.jpg",
      },
      {
        "name": "Sewa Jaket Waterproof Hiking",
        "price": "Rp. 35.000/hari",
        "stock": "Tersedia: 5 pcs",
        "image": "hiking_jacket.jpg",
      },
      {
        "name": "Sewa Botol Minum Lipat",
        "price": "Rp. 5.000/hari",
        "stock": "Tersedia: 30 pcs",
        "image": "foldable_bottle.jpg",
      },
      {
        "name": "Sewa Kompas Digital",
        "price": "Rp. 15.000/hari",
        "stock": "Tersedia: 12 pcs",
        "image": "digital_compass.jpg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyWishlist',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5A6A41), fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 1200 ? 5 : constraints.maxWidth > 900 ? 4 : constraints.maxWidth > 600 ? 3 : 2;
            double childAspectRatio = (constraints.maxWidth / crossAxisCount) / (constraints.maxHeight / 2);

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
                return Card(
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
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              product['name']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis, // Tambahkan ini
                              maxLines: 2, // Tambahkan ini
                            ),
                            Text(
                              product['price']!,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.green,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                              ),
                              child: const Text(
                                '+ Add To Cart',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}