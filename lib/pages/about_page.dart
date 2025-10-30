import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Bu uygulama mobil ödev projesidir.\nHazırlayan: \nTuna Duman \nCenker Karalar',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
