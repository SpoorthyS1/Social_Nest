// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CategoryPage extends StatelessWidget {
//   final String categoryName;

//   CategoryPage({required this.categoryName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$categoryName Services'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('localrequirements')
//             .where('category', isEqualTo: categoryName.toLowerCase())
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No data found for $categoryName'));
//           }

//           // Extract the document and 'data' field
//           final doc = snapshot.data!.docs.first; // Assume one document per category
//           final List<dynamic> data = doc['data'];

//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               final item = data[index] as Map<String, dynamic>;

//               // Create a list of key-value pairs for dynamic display
//               List<Widget> details = [];
//               item.forEach((key, value) {
//                 details.add(
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "$key: ",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Expanded(child: Text(value.toString())),
//                       ],
//                     ),
//                   ),
//                 );
//               });

//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: details,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CategoryPage extends StatelessWidget {
//   final String categoryName;

//   CategoryPage({required this.categoryName});

//   // Define a global field priority list for ordering
//   final List<String> globalFieldOrder = [
//     'name',
//     'names',
//     'Names',
//     'ngo_names',
//     'clinicname',
//     'Name',
//     'schoolinfo',
//     'address',
//     'phone',
//     'rating',
//     'location',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$categoryName Services'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('localrequirements')
//             .where('category', isEqualTo: categoryName.toLowerCase())
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No data found for $categoryName'));
//           }

//           // Combine all documents into a single list
//           final allData = snapshot.data!.docs
//               .expand((doc) => (doc['data'] as List<dynamic>))
//               .toList();

//           return ListView.builder(
//             itemCount: allData.length,
//             itemBuilder: (context, index) {
//               final item = allData[index] as Map<String, dynamic>;

//               // Extract and order fields dynamically
//               List<Widget> details = [];

//               // Add fields in the specified order
//               for (String field in globalFieldOrder) {
//                 if (item.containsKey(field)) {
//                   details.add(
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "$field: ",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Expanded(child: Text(item[field].toString())),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }

//               // Add remaining fields not in the priority list
//               item.forEach((key, value) {
//                 if (!globalFieldOrder.contains(key)) {
//                   details.add(
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "$key: ",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Expanded(child: Text(value.toString())),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               });

//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: details,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({required this.categoryName});

  // Define a global field priority list for ordering
  final List<String> globalFieldOrder = [
    'name',
    'names',
    'Names',
    'ngo_names',
    'clinicname',
    'Name',
    'schoolinfo',
    'address',
    'phone',
    'rating',
    'location',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName Services'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('localrequirements')
            .where('category', isEqualTo: categoryName.toLowerCase())
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No data found for $categoryName',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            );
          }

          // Combine all documents into a single list
          final allData = snapshot.data!.docs
              .expand((doc) => (doc['data'] as List<dynamic>))
              .toList();

          return ListView.builder(
            itemCount: allData.length,
            itemBuilder: (context, index) {
              final item = allData[index] as Map<String, dynamic>;

              // Extract and order fields dynamically
              List<Widget> details = [];

              // Add fields in the specified order
              for (String field in globalFieldOrder) {
                if (item.containsKey(field)) {
                  details.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$field: ",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              item[field].toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }

              // Add remaining fields not in the priority list
              item.forEach((key, value) {
                if (!globalFieldOrder.contains(key)) {
                  details.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$key: ",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.secondary,
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
                    ),
                  );
                }
              });

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: details,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
