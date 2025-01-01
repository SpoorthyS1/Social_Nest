// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:uuid/uuid.dart';

// class PostFoodPage extends StatefulWidget {
//   final String userId;

//   PostFoodPage({required this.userId});

//   @override
//   _PostFoodPageState createState() => _PostFoodPageState();
// }

// class _PostFoodPageState extends State<PostFoodPage> {
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final TextEditingController _contactController = TextEditingController();
//   File? _selectedImage;

//   final _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<String?> _uploadImage(File image) async {
//     try {
//       final storageRef = FirebaseStorage.instance.ref();
//       final imageRef = storageRef.child('food_images/${Uuid().v4()}.jpg');
//       await imageRef.putFile(image);
//       return await imageRef.getDownloadURL();
//     } catch (e) {
//       print("Error uploading image: $e");
//       return null;
//     }
//   }

//   void _postFood() async {
//     final description = _descriptionController.text.trim();
//     final quantity = _quantityController.text.trim();
//     final location = _locationController.text.trim();
//     final contact = _contactController.text.trim();

//     if (description.isNotEmpty && quantity.isNotEmpty && location.isNotEmpty && contact.isNotEmpty) {
//       String? imageUrl;

//       if (_selectedImage != null) {
//         imageUrl = await _uploadImage(_selectedImage!);
//       }

//       await FirebaseFirestore.instance.collection('foodPosts').add({
//         'description': description,
//         'quantity': quantity,
//         'location': location,
//         'contact': contact,
//         'imageUrl': imageUrl,
//         'userId': widget.userId,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Food posted successfully!"),
//       ));

//       _clearForm();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Please fill all fields."),
//       ));
//     }
//   }

//   void _clearForm() {
//     _descriptionController.clear();
//     _quantityController.clear();
//     _locationController.clear();
//     _contactController.clear();
//     setState(() {
//       _selectedImage = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Post Excess Food"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//               TextField(
//                 controller: _quantityController,
//                 decoration: InputDecoration(labelText: 'Quantity'),
//               ),
//               TextField(
//                 controller: _locationController,
//                 decoration: InputDecoration(labelText: 'Location'),
//               ),
//               TextField(
//                 controller: _contactController,
//                 decoration: InputDecoration(labelText: 'Contact Info'),
//               ),
//               SizedBox(height: 20),
//               _selectedImage == null
//                   ? Text("No image selected")
//                   : Image.file(_selectedImage!, height: 150),
//               TextButton.icon(
//                 icon: Icon(Icons.add_photo_alternate),
//                 label: Text("Upload Image (Optional)"),
//                 onPressed: _pickImage,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _postFood,
//                 child: Text("Post Food"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';

class PostFoodPage extends StatefulWidget {
  final String userId;

  PostFoodPage({required this.userId});

  @override
  _PostFoodPageState createState() => _PostFoodPageState();
}

class _PostFoodPageState extends State<PostFoodPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  File? _selectedImage;

  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('food_images/${Uuid().v4()}.jpg');
      await imageRef.putFile(image);
      return await imageRef.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  void _postFood() async {
    final description = _descriptionController.text.trim();
    final quantity = _quantityController.text.trim();
    final location = _locationController.text.trim();
    final contact = _contactController.text.trim();

    if (description.isNotEmpty && quantity.isNotEmpty && location.isNotEmpty && contact.isNotEmpty) {
      String? imageUrl;

      if (_selectedImage != null) {
        imageUrl = await _uploadImage(_selectedImage!);
      }

      final postId = Uuid().v4();

      await FirebaseFirestore.instance.collection('foodPosts').doc(postId).set({
        'description': description,
        'quantity': quantity,
        'location': location,
        'contact': contact,
        'imageUrl': imageUrl,
        'userId': widget.userId,
        'postId': postId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Food posted successfully!"),
      ));

      _clearForm();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill all fields."),
      ));
    }
  }

  void _clearForm() {
    _descriptionController.clear();
    _quantityController.clear();
    _locationController.clear();
    _contactController.clear();
    setState(() {
      _selectedImage = null;
    });
  }

  void _deletePost(String postId) async {
    try {
      // Delete from Firestore
      await FirebaseFirestore.instance.collection('foodPosts').doc(postId).delete();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Post deleted successfully!"),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error deleting post: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Post Excess Food"),
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact Info'),
              ),
              SizedBox(height: 20),
              _selectedImage == null
                  ? Text("No image selected")
                  : Image.file(_selectedImage!, height: 150),
              TextButton.icon(
                icon: Icon(Icons.add_photo_alternate),
                label: Text("Upload Image (Optional)"),
                onPressed: _pickImage,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _postFood,
                child: Text("Post Food"),
              ),
              SizedBox(height: 20),
              Divider(),
              Text(
                "Your Posts",
                style: theme.textTheme.titleLarge,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('foodPosts')
                    .where('userId', isEqualTo: widget.userId)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text("Error loading posts.");
                  }

                  final posts = snapshot.data?.docs ?? [];

                  if (posts.isEmpty) {
                    return Text("No posts found.");
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(post['description']),
                          subtitle: Text("Quantity: ${post['quantity']}\nLocation: ${post['location']}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deletePost(post.id),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
