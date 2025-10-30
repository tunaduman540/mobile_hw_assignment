import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  final List<Map<String, String>> instructors = const [
    {'name': 'Dr. Ali Veli', 'phone': '+905551112233', 'email': 'ali@uni.edu.tr'},
    {'name': 'Prof. Ayşe Demir', 'phone': '+905551234567', 'email': 'ayse@uni.edu.tr'},
    {'name': 'Dr. Mehmet Kaya', 'phone': '+905556667788', 'email': 'mehmet@uni.edu.tr'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: instructors.length,
      itemBuilder: (context, index) {
        final instructor = instructors[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(instructor['name']!),
            subtitle: Text('E-posta: ${instructor['email']}'),
            trailing: ElevatedButton(
              onPressed: () async {
                final call = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Arama yap'),
                    content: Text('${instructor['name']} adlı kişiyi aramak istiyor musun?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Hayır'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Evet'),
                      ),
                    ],
                  ),
                );

                if (call == true) {
                  final Uri url = Uri.parse('tel:${instructor['phone']}');
                  await launchUrl(url);
                }
              },
              child: const Text('Ara'),
            ),
          ),
        );
      },
    );
  }
}
