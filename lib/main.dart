import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/wishlist_page.dart';
import 'pages/chat_page.dart';
import 'pages/transaction_page.dart';
import 'pages/basket_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const WishlistPage(),
    const ChatPage(),
    const TransactionPage(),
    const BasketPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, color: Colors.brown, size: 45.0,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.brown, size: 45.0),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.brown, size: 45.0,),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long, color: Colors.brown, size: 45.0,),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: Colors.brown, size: 45.0,),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 4, 122, 14),
        unselectedItemColor: Color(0xFF5A6A41),
        onTap: _onItemTapped,
      ),
    );
  }
}
