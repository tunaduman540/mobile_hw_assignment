import 'package:flutter/material.dart';

class PhotoViewPage extends StatelessWidget {
  final String imagePath;
  final String title;

  const PhotoViewPage({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: InteractiveViewer(
          // Zoom yapmak için
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
