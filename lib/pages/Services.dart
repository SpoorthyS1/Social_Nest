import 'package:flutter/material.dart';
import 'package:social_nest/component/Service_tile.dart';
import 'package:social_nest/pages/HomePage.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  // Services data: Includes service names, image paths, and destination pages
  final List<Map<String, dynamic>> services = [
    {
      'title': 'Health & Hygiene',
      'image': 'assets/nest.jpg',
      'page': HomePage(),
    },
    {
      'title': 'Education & Learning',
      'image': 'assets/nest.jpg',
      'page': HomePage(),
    },
    {
      'title': 'Community Events',
      'image': 'assets/nest.jpg',
      'page': HomePage(),
    },
    {
      'title': 'Volunteering Opportunities',
      'image': 'assets/nest.jpg',
      'page': HomePage(),
    },
    {
      'title': 'Health & Hygiene',
      'image': 'assets/nest.jpg',
      'page': HomePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Container
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              image: DecorationImage(
                image: AssetImage('assets/nest.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 224, 145, 220)
                      .withOpacity(0.4), // Light purple overlay
                  BlendMode.srcOver,
                ),
              ),
            ),
            child: Stack(
              children: [
                // Semi-transparent white overlay to lighten the image
                Container(
                  color: Colors.white.withOpacity(0.5), // Adjust opacity
                ),
                // Centered text
                Center(
                  child: Text(
                    'Connect with your community',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 1, 119, 107),
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Services List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ServiceTile(
                        taskName: services[index]['title'],
                        imagepath: services[index]['image'],
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the respective page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => services[index]['page'],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
