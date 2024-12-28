import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewFoodPage extends StatelessWidget {
  final String userId;

  ViewFoodPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Food"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('foodPosts').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error fetching data."));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No food posts available."));
          }

          final foodPosts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: foodPosts.length,
            itemBuilder: (context, index) {
              final post = foodPosts[index].data() as Map<String, dynamic>;
              final canDelete = post['userId'] == userId;

              return Card(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (post['imageUrl'] != null)
                      Image.network(
                        post['imageUrl'],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description: ${post['description']}"),
                          Text("Quantity: ${post['quantity']}"),
                          Text("Location: ${post['location']}"),
                          Text("Contact: ${post['contact']}"),
                        ],
                      ),
                    ),
                    if (canDelete)
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await foodPosts[index].reference.delete();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Post deleted."),
                            ));
                          },
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
