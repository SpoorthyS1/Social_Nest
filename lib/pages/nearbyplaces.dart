// import 'package:flutter/material.dart';
// import 'package:social_nest/pages/categoryplaces.dart';
// // Import the CategoryPlacesPage

// class NearbyPlacesPage extends StatelessWidget {
//   final List<String> categories = [
//     'ngos',
//     'parks',
//     'theatre',
//     'cafes',
//     'temples',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Nearby Places"),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(8.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//         ),
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           return Card(
//             elevation: 5,
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CategoryPlacesPage(category: category),
//                   ),
//                 );
//               },
//               child: Center(
//                 child: Text(
//                   category,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:social_nest/pages/categoryplaces.dart';

class NearbyPlacesPage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'name': 'ngos',
      'image': 'assets/ngo.png',
    },
    {
      'name': 'parks',
      'image': 'assets/parks.png',
    },
    {
      'name': 'theatre',
      'image': 'assets/theatre.png',
    },
    {
      'name': 'cafes',
      'image': 'assets/cafe.png',
    },
    {
      'name': 'temples',
      'image': 'assets/temple.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Places"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPlacesPage(category: category['name']!),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    // Image Background
                    Image.asset(
                      category['image']!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Category Name
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        category['name']!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black54,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
