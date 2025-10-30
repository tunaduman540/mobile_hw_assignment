import 'package:flutter/material.dart';
import 'photo_view_page.dart'; // Birazdan bu sayfayı oluşturacağız

class InfrastructurePage extends StatelessWidget {
  final List<Map<String, String>> classrooms = [
    {'name': 'Bilgisayar Laboratuvarı', 'image': 'assets/classroom1.jpg'},
    {'name': 'Elektronik Laboratuvarı', 'image': 'assets/classroom2.jpg'},
    {'name': 'Yazılım Sınıfı', 'image': 'assets/lab1.jpg'},
    {'name': 'Donanım Sınıfı', 'image': 'assets/lab2.jpg'},
  ];

  InfrastructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Altyapı')),
      body: ListView.builder(
        itemCount: classrooms.length,
        itemBuilder: (context, index) {
          final classroom = classrooms[index];
          return GestureDetector(
            onDoubleTap: () {
              // Çift tıklanınca resim büyütme sayfasına git
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewPage(
                    imagePath: classroom['image']!,
                    title: classroom['name']!,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.meeting_room, color: Colors.blue),
                title: Text(classroom['name']!),
                subtitle: const Text('Çift tıklayarak görüntüleyin'),
              ),
            ),
          );
        },
      ),
    );
  }
}
