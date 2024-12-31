import 'package:flutter/material.dart';
import 'package:social_nest/component/Service_tile.dart';
import 'package:social_nest/pages/Electricians.dart';
import 'package:social_nest/pages/HomePage.dart';
import 'package:social_nest/pages/Notifications.dart';
import 'package:social_nest/pages/Settings.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  int _selectedIndex = 1;

  // Services data: Includes service names, image paths, and destination pages
  final List<Map<String, dynamic>> services = [
    {
      'title': 'Electrician',
      'image': 'assets/electrician.jpg',
      'page': Electricians(),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Services()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Notifications()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Container with gradient
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 239, 70, 84),
                  const Color.fromARGB(255, 240, 0, 20),
                  // Your blue primary color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                // Semi-transparent overlay
                Container(
                  color: Colors.white.withOpacity(0.1),
                ),
                // Back button
                Positioned(
                  top: 20.0,
                  left: 10.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the HomePage
                    },
                  ),
                ),
                // Centered text
                Center(
                  child: Text(
                    'Connect with your community',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Services List with Card-style UI
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {
                        // Navigate to the respective page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => services[index]['page'],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Service Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                services[index]['image'],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            // Service Title
                            Expanded(
                              child: Text(
                                services[index]['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            // Arrow Icon
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar with theme-based customization
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_sharp),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
