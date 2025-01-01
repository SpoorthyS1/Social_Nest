import 'package:flutter/material.dart';
import 'package:social_nest/pages/categoryplaces.dart';
// Import the CategoryPlacesPage

class NearbyPlacesPage extends StatelessWidget {
  final List<String> categories = [
    'NGO',
    'Parks',
    'Theatre',
    'Cafes',
    'Temples',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Places"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPlacesPage(category: category),
                  ),
                );
              },
              child: Center(
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
