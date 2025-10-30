import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(title: Text('Mobil Programlama')),
        ListTile(title: Text('Veri Yapıları')),
        ListTile(title: Text('Yapay Zeka')),
        ListTile(title: Text('Algoritma Analizi')),
      ],
    );
  }
}
