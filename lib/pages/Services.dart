// import 'package:flutter/material.dart';
// import 'package:social_nest/component/Service_tile.dart';
// import 'package:social_nest/pages/Electricians.dart';
// import 'package:social_nest/pages/HomePage.dart';
// import 'package:social_nest/pages/Notifications.dart';
// import 'package:social_nest/pages/Settings.dart';
// import 'package:social_nest/pages/foodOptions.dart';

// class Services extends StatefulWidget {
//   const Services({super.key});

//   @override
//   State<Services> createState() => _ServicesState();
// }

// class _ServicesState extends State<Services> {
//   int _selectedIndex = 1;

//   // Services data: Includes service names, image paths, and destination pages
//   final List<Map<String, dynamic>> services = [
//     {
//       'title': 'Electrician',
//       'image': 'assets/electrician.jpg',
//       'page': Electricians(),
//     },
//     {
//       'title': 'Education & Learning',
//       'image': 'assets/nest.jpg',
//       'page': HomePage(),
//     },
//     {
//       'title': 'Community Events',
//       'image': 'assets/nest.jpg',
//       'page': HomePage(),
//     },
//     {
//       'title': 'Volunteering Opportunities',
//       'image': 'assets/nest.jpg',
//       'page': HomePage(),
//     },
//     {
//       'title': 'Health & Hygiene',
//       'image': 'assets/nest.jpg',
//       'page': HomePage(),
//     },
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//         break;
//       case 1:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => Services()),
//         );
//         break;
//       case 2:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => FoodOptionsPage(userId: '')),
//         );
//         break;
//       case 3:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => Settings()),
//         );
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Header Container with gradient
//           Container(
//             width: double.infinity,
//             height: 250,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0),
//               gradient: LinearGradient(
//                 colors: [
//                   const Color.fromARGB(255, 239, 70, 84),
//                   const Color.fromARGB(255, 240, 0, 20),
//                   // Your blue primary color
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // Semi-transparent overlay
//                 Container(
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//                 // Back button
//                 Positioned(
//                   top: 20.0,
//                   left: 10.0,
//                   child: IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     color: Colors.white,
//                     onPressed: () {
//                       Navigator.pop(context); // Navigate back to the HomePage
//                     },
//                   ),
//                 ),
//                 // Centered text
//                 Center(
//                   child: Text(
//                     'Connect with your community',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       letterSpacing: 1.5,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Services List with Card-style UI
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: ListView.builder(
//                 itemCount: services.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     elevation: 8.0,
//                     margin: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(12.0),
//                       onTap: () {
//                         // Navigate to the respective page
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => services[index]['page'],
//                           ),
//                         );
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             // Service Image
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10.0),
//                               child: Image.asset(
//                                 services[index]['image'],
//                                 width: 80,
//                                 height: 80,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             SizedBox(width: 16),
//                             // Service Title
//                             Expanded(
//                               child: Text(
//                                 services[index]['title'],
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ),
//                             // Arrow Icon
//                             Icon(
//                               Icons.arrow_forward_ios,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),

//       // Bottom Navigation Bar with theme-based customization
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor:
//             Theme.of(context).bottomNavigationBarTheme.backgroundColor,
//         selectedItemColor:
//             Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
//         unselectedItemColor:
//             Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_repair_service_sharp),
//             label: 'Services',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fastfood),
//             label: 'Donation',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:social_nest/pages/HomePage.dart';
// import 'package:social_nest/pages/Settings.dart';
// import 'package:social_nest/pages/categorypage.dart';
// import 'package:social_nest/pages/foodOptions.dart';

// class ServicesTab extends StatefulWidget {
//   @override
//   State<ServicesTab> createState() => _ServicesTabState();
// }

// class _ServicesTabState extends State<ServicesTab> {
//   int _selectedIndex = 1;

//  final List<Map<String, dynamic>> categories = [
//     {'title': 'Doctors', 'icon': Icons.local_hospital, 'category': 'doctors'},   
//     {'title': 'NGOs', 'icon': Icons.volunteer_activism, 'category': 'ngos'},
//     {'title': 'Electricals', 'icon': Icons.electrical_services, 'category': 'electricals'},
//     {'title': 'Physiotherapists', 'icon': Icons.accessibility, 'category': 'physiotherapist'},
//     {'title': 'Schools', 'icon': Icons.school, 'category': 'schools'},
//     {'title': 'Carpenters', 'icon': Icons.handyman, 'category': 'carpenters'},
//     {'title': 'Mechanics', 'icon': Icons.build, 'category': 'mechanic'},
//     {'title': 'Tuitions', 'icon': Icons.school, 'category': 'tuitions'},
//     {'title': 'Police', 'icon': Icons.local_police, 'category': 'police'},
//     {'title': 'Post', 'icon': Icons.local_post_office, 'category': 'post'},
//     {'title': 'Medicals', 'icon': Icons.medical_services, 'category': 'medicals'},
//     {'title': 'IAS', 'icon': Icons.person, 'category': 'ias'},
//     {'title': 'Food Stalls', 'icon': Icons.fastfood, 'category': 'foodstalls'},
//     {'title': 'Bus Timings', 'icon': Icons.directions_bus, 'category': 'busTime'},
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//         break;
//       case 2:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => FoodOptionsPage(userId: '')),
//         );
//         break;
//       case 3:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => Settings()),
//         );
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Services'),
//       ),
//       body: ListView.builder(
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               leading: Icon(category['icon'], size: 40),
//               title: Text(category['title'], style: TextStyle(fontSize: 18)),
//               trailing: Icon(Icons.arrow_forward),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CategoryPage(
//                       categoryName: category['category'], // Pass only the category name
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
//         selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
//         unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_repair_service_sharp),
//             label: 'Services',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fastfood),
//             label: 'Donation',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:social_nest/pages/HomePage.dart';
import 'package:social_nest/pages/Settings.dart';
import 'package:social_nest/pages/categorypage.dart';
import 'package:social_nest/pages/foodOptions.dart';

class ServicesTab extends StatefulWidget {
  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Doctors',
      'icon': Icons.local_hospital,
      'category': 'doctors',
      'image': 'assets/doctors.png',
    },
    {
      'title': 'NGOs',
      'icon': Icons.volunteer_activism,
      'category': 'ngos',
      'image': 'assets/ngo.png',
    },
    {
      'title': 'Electricals',
      'icon': Icons.electrical_services,
      'category': 'electricals',
      'image': 'assets/electrician.jpg',
    },
    {
      'title': 'Physiotherapists',
      'icon': Icons.accessibility,
      'category': 'physiotherapist',
      'image': 'assets/physioterpist.png',
    },
    {
      'title': 'Schools',
      'icon': Icons.school,
      'category': 'schools',
      'image': 'assets/schools.png',
    },
    {
      'title': 'Carpenters',
      'icon': Icons.handyman,
      'category': 'carpenters',
      'image': 'assets/carpenters.png',
    },
    {
      'title': 'Mechanics',
      'icon': Icons.build,
      'category': 'mechanic',
      'image': 'assets/mechanic.png',
    },
    {
      'title': 'Tuitions',
      'icon': Icons.school,
      'category': 'tuitions',
      'image': 'assets/tuition.png',
    },
    {
      'title': 'Police',
      'icon': Icons.local_police,
      'category': 'police',
      'image': 'assets/police.png',
    },
    {
      'title': 'Post',
      'icon': Icons.local_post_office,
      'category': 'post',
      'image': 'assets/post.png',
    },
    {
      'title': 'Medicals',
      'icon': Icons.medical_services,
      'category': 'medicals',
      'image': 'assets/medical.png',
    },
    {
      'title': 'IAS',
      'icon': Icons.person,
      'category': 'ias',
      'image': 'assets/ias.png',
    },
    {
      'title': 'Food Stalls',
      'icon': Icons.fastfood,
      'category': 'foodstalls',
      'image': 'assets/tiffin.png',
    },
    {
      'title': 'Bus Timings',
      'icon': Icons.directions_bus,
      'category': 'busTime',
      'image': 'assets/busterminal.png',
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
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FoodOptionsPage(userId: '')),
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
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    category['image'], // Display category image
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  category['title'],
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  'Explore ${category['title']} services',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryName: category['category'], // Pass category
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
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
