import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  TransactionPageState createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  int _selectedSegment = 0;

  final List<Map<String, dynamic>> _pesananDibatalkan = [
    {
      'nama': 'Tenda Camping',
      'jumlah': 1,
      'status': 'Dibatalkan',
      'gambar': 'tent.jpg',
      'tanggal': '2024-03-15',
    },
  ];

  final List<Map<String, dynamic>> _pesananBelumDiambil = [
    {
      'nama': 'Sleeping Bag',
      'jumlah': 2,
      'status': 'Belum diambil',
      'gambar': 'matras.jpg',
      'tanggal': '2024-03-16',
    },
  ];

  final List<Map<String, dynamic>> _pesananBelumDikembalikan = [
    {
      'nama': 'Kompor Camping',
      'jumlah': 1,
      'status': 'Belum dikembalikan',
      'gambar': 'portable_stove.png',
      'tanggal': '2024-03-17',
    },
  ];

  final List<Map<String, dynamic>> _pesananSelesai = [
    {
      'nama': 'Matras Camping',
      'jumlah': 3,
      'status': 'Selesai',
      'gambar': 'matras.jpg',
      'tanggal': '2024-03-18',
    },
  ];

  final List<Map<String, dynamic>> _pengembalian = [
    {
      'nama': 'Tenda Camping',
      'jumlah': 1,
      'status': 'Belum dikembalikan',
      'Tenggat Pengembalian': '2024-03-20',
      'gambar': 'tent.jpg',
    },
    {
      'nama': 'Sleeping Bag',
      'jumlah': 2,
      'status': 'Sudah dikembalikan',
      'Tenggat Pengembalian': '2024-03-21',
      'gambar': 'sleeping_bag.jpg',
    },
    {
      'nama': 'Kompor Camping',
      'jumlah': 1,
      'status': 'Sudah dikembalikan',
      'Tenggat Pengembalian': '2024-03-22',
      'gambar': 'portable_stove.png',
    },
    {
      'nama': 'Matras Camping',
      'jumlah': 3,
      'status': 'Sudah dikembalikan',
      'Tenggat Pengembalian': '2024-03-23',
      'gambar': 'matras.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5A6A41))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSegmentButton('Dibatalkan', 0),
                  _buildSegmentButton('Belum Diambil', 1),
                  _buildSegmentButton('Belum Dikembalikan', 2),
                  _buildSegmentButton('Selesai', 3),
                ],
              ),
            ),
            _buildPesananList(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Monitoring Pengembalian Alat',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5A6A41))),
            ),
            _buildPengembalianList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSegment = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedSegment == index ? Colors.brown : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _selectedSegment == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildPesananList() {
    List<Map<String, dynamic>> pesananList;
    switch (_selectedSegment) {
      case 0:
        pesananList = _pesananDibatalkan;
        break;
      case 1:
        pesananList = _pesananBelumDiambil;
        break;
      case 2:
        pesananList = _pesananBelumDikembalikan;
        break;
      case 3:
        pesananList = _pesananSelesai;
        break;
      default:
        pesananList = [];
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: pesananList.length,
      itemBuilder: (context, index) {
        final pesanan = pesananList[index];
        return Card(
          margin: EdgeInsets.all(12.0), // Perbesar margin card
          elevation: 4.0, // Tambahkan elevasi untuk efek 3D
          child: Padding( // Tambahkan padding di dalam card
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(pesanan['gambar'], width: 250, height: 250),
              title: Text(pesanan['nama']),
              subtitle: Text('Jumlah: ${pesanan['jumlah']}, Tanggal: ${pesanan['tanggal']}'),
              trailing: _buildStatusIcon(pesanan['status']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPengembalianList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _pengembalian.length,
      itemBuilder: (context, index) {
        final pengembalian = _pengembalian[index];
        return Card(
          margin: EdgeInsets.all(12.0), // Perbesar margin card
          elevation: 4.0, // Tambahkan elevasi untuk efek 3D
          child: Padding( // Tambahkan padding di dalam card
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(pengembalian['gambar'], width: 250, height: 250),
              title: Text(pengembalian['nama']),
              subtitle: Text('Jumlah: ${pengembalian['jumlah']}, Tenggat Pengembalian: ${pengembalian['Tenggat Pengembalian']}'),
              trailing: _buildStatusIcon(pengembalian['status']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusIcon(String status) {
    Color color;
    IconData icon;
    if (status == 'Selesai' || status == 'Sudah dikembalikan') {
      color = Colors.green;
      icon = Icons.check_circle;
    } else if (status == 'Dibatalkan') {
      color = Colors.red;
      icon = Icons.cancel;
    } else {
      color = Colors.orange;
      icon = Icons.access_time;
    }
    return Icon(icon, color: color);
  }
}