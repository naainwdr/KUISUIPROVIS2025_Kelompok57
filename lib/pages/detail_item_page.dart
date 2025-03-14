import 'package:flutter/material.dart';

class DetailItemPage extends StatelessWidget {
  const DetailItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
              'Detail Produk', style: TextStyle(
              color: Color(0xFF5A6A41),
              fontWeight: FontWeight.bold,
              ),
            ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, size: 40),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded( // Tambahkan Expanded agar konten scrollable
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'SALE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Image.asset(
                          'paket1.jpg',
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'PAKET 1',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Full Set',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star_border),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tetra Backpack, which has a mix of urban and nature designs, has three color choices.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Spesifikasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Dimension: H: 47,5 x W: 31 x D: 15 cm',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Capacity: 22 L',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Weight: 0.6 Kg',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Reviews 39',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            SizedBox(width: 8),
                            Text(
                              '4.4/5', // Tambahkan rating di sini
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Bagian Review yang Diperbarui dengan Kotak
                        Column(
                          children: [
                            _buildReviewBox('logo.png',
                                "Tasnya bagus banget, bahannya kuat dan nyaman dipakai. Resletingnya juga lancar. Sangat rekomendasi!"),
                            SizedBox(height: 8),
                            _buildReviewBox('logo.png',
                                "Desainnya keren, cocok untuk kegiatan outdoor. Kapasitasnya juga cukup besar."),
                            SizedBox(height: 8),
                            _buildReviewBox('logo.png',
                                "Pengiriman cepat, packing rapi. Tasnya sesuai dengan deskripsi."),
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: () {},
                              child: Text('Review Lainnya'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Harga dan Button "Add To Cart" Dipindahkan ke Bawah
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp. 300.000',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('+ Add To Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat kotak review
  Widget _buildReviewBox(String imageUrl, String reviewText) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            reviewText,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}