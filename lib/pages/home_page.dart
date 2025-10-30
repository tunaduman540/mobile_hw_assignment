import 'package:flutter/material.dart';
import 'infrastructure_page.dart';
import 'people_page.dart'; // kişiler sayfası
import 'about_page.dart'; // hakkında
import 'courses_page.dart'; // dersler

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AboutPage(),
    const PeoplePage(),
    InfrastructurePage(),
    const CoursesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Department App')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Hakkında'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Kişiler'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Altyapı'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Dersler'),
        ],
      ),
    );
  }
}
