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

      await FirebaseFirestore.instance.collection('foodPosts').add({
        'description': description,
        'quantity': quantity,
        'location': location,
        'contact': contact,
        'imageUrl': imageUrl,
        'userId': widget.userId,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Excess Food"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
