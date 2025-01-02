// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CategoryPlacesPage extends StatefulWidget {
//   final String category;

//   const CategoryPlacesPage({Key? key, required this.category}) : super(key: key);

//   @override
//   _CategoryPlacesPageState createState() => _CategoryPlacesPageState();
// }

// class _CategoryPlacesPageState extends State<CategoryPlacesPage> {
//   late Stream<QuerySnapshot> _placesStream;

//   @override
//   void initState() {
//     super.initState();
//     // Fetch places for the selected category from Firestore
//     _placesStream = FirebaseFirestore.instance
//         .collection('places')
//         .where('category', isEqualTo: widget.category)
//         .snapshots();
//   }

//   Widget _buildDynamicTile(Map<String, dynamic> data) {
//     // Dynamically build the ListTile from the map
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: data.entries.map((entry) {
//             // Display each key-value pair dynamically
//             final key = entry.key;
//             final value = entry.value;
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4.0),
//               child: Text(
//                 "$key: ${value.toString()}",
//                 style: const TextStyle(fontSize: 16),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.category),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _placesStream,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No data available.'));
//           }

//           // Extract data from Firestore
//           var places = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: places.length,
//             itemBuilder: (context, index) {
//               var place = places[index].data() as Map<String, dynamic>;
//               var dataArray = place['data'] as List<dynamic>;

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Display category name (optional, as it's already on the page)
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       place['category'],
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   // Display dynamic data array
//                   ...dataArray.map((item) => _buildDynamicTile(item as Map<String, dynamic>)),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryPlacesPage extends StatefulWidget {
  final String category;

  const CategoryPlacesPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPlacesPageState createState() => _CategoryPlacesPageState();
}

class _CategoryPlacesPageState extends State<CategoryPlacesPage> {
  late Stream<QuerySnapshot> _placesStream;

  @override
  void initState() {
    super.initState();
    // Fetch places for the selected category from Firestore
    _placesStream = FirebaseFirestore.instance
        .collection('places')
        .where('category', isEqualTo: widget.category)
        .snapshots();
  }

  Widget _buildDynamicTile(Map<String, dynamic> data) {
    // Dynamically build the ListTile from the map
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.entries.map((entry) {
            final key = entry.key;
            final value = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$key: ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _placesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No data available.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            );
          }

          // Extract data from Firestore
          var places = snapshot.data!.docs;

          return ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) {
              var place = places[index].data() as Map<String, dynamic>;
              var dataArray = place['data'] as List<dynamic>;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display category name (optional, as it's already on the page)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      place['category'],
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  // Display dynamic data array
                  ...dataArray.map((item) => _buildDynamicTile(item as Map<String, dynamic>)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
