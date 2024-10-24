// lib/common_layout.dart
import 'package:flutter/material.dart';
import 'package:stonks/Dashboard.dart';
import 'package:stonks/main_pages/credit/chatscreen.dart';
import 'package:stonks/main_pages/invesmnet/investment_page.dart';

import 'main_pages/Dashboard/news.dart';


class CommonLayout extends StatefulWidget {
  final Widget child;
  const CommonLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<CommonLayout> createState() => _CommonLayoutState();
}

class _CommonLayoutState extends State<CommonLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const News()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const InvestmentPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Expense and Debt Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Micro-investment Accessibility',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Credit Score Transparency',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}