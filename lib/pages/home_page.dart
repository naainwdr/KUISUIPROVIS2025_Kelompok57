import 'package:flutter/material.dart';
import '../widgets/flashsale_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 236, 224),
      body: Column(
        children: [
          AppBar(
            title: Row(
              children: const [
                Icon(
                  Icons.store_rounded,
                  color: Color(0xFF5A6A41),
                  size: 40.0, // Ganti dengan ukuran yang Anda inginkan
                ),
                Text('TENDAKU', style: TextStyle(
                      color: Color(0xFF5A6A41),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('logo.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What are you need for?',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                flashsaleCard(),
                categoryButtons(),
                nearbySection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
