import 'package:flutter/material.dart';
import '../pages/detail_item_page.dart' show DetailItemPage;

Widget flashsaleCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Column(
        children: [
          Image.asset(
            'home.jpg',
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.zero, // Padding diatur ke nol
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: const [
                      Icon(Icons.verified, color: Colors.blue),
                      SizedBox(width: 2), // Kurangi lebar SizedBox
                      Text(
                        'Sewa Alat Kemah Terpercaya dan Berkualitas',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Ukuran font dikurangi
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Kurangi padding tombol
                    minimumSize: Size(80, 30), // Kurangi ukuran minimum tombol
                  ),
                  child: const Text('RENT NOW'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
Widget categoryButtons() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) { // Sesuaikan nilai 600 sesuai kebutuhan
          // Jika lebar cukup besar, tampilkan dalam satu baris menggunakan Row
          return Row(
            children: [
              for (var category in ['Tenda', 'Jaket', 'Gas Portabel', 'Carrier Bag', 'Hand Glove', 'Sepatu'])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Tambahkan padding horizontal
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(category),
                    ),
                  ),
                ),
            ],
          );
        } else {
          // Jika lebar tidak cukup, gunakan Wrap untuk bertumpuk secara responsif
          return Wrap(
            spacing: 8,
            children: ['Tenda', 'Jaket', 'Gas Portabel', 'Carrier Bag', 'Hand Glove', 'Sepatu']
                .map(
                  (category) => ElevatedButton(
                    onPressed: () {},
                    child: Text(category),
                  ),
                )
                .toList(),
          );
        }
      },
    ),
  );
}

Widget nearbySection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.grade_rounded, color: Colors.brown, size: 40),
            Expanded( // Menggunakan Expanded
              child: Padding( // Tambahkan padding untuk ruang di dalam Expanded
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PAKET BUNDLING TERBAIK BULAN INI',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              child: const Text('Lihat Semua'),
            ),
          ],
        ),
        SizedBox(
          height: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: flashsaleMenu(context),
          ),
        ),
      ],
    ),
  );
}

List<Widget> flashsaleMenu(BuildContext context) {
  List<Map<String, String>> alatKemah = [
    {'name': 'Paket 1 : Full Set', 'price': 'Rp. 400.000/day', 'image': 'paket1.jpg'},
    {'name': 'Paket 2 : Cook Set', 'price': 'Rp. 150.000/day', 'image': 'paket2.jpg'},
    {'name': 'Paket 3 : Camping Set', 'price': 'Rp. 300.000/day', 'image': 'paket3.jpg'},
    {'name': 'Paket 4 : Barbeque Set', 'price': 'Rp. 100.000/day', 'image': 'paket4.png'},
  ];

  return alatKemah
      .map(
        (res) => SizedBox(
          width: 250,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    res['image']!,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          res['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          overflow: TextOverflow.ellipsis, // Tangani teks panjang
                        ),
                        Text(
                          res['price']!,
                          style: const TextStyle(color: Colors.grey, fontSize: 15),
                          overflow: TextOverflow.ellipsis, // Tangani teks panjang
                          maxLines: 1, // Batasi jumlah baris
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailItemPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Details'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      .toList();
}