import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:social_nest/methods/firebase_auth_methods.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final Map<String, String> userDetails = {
    'First Name': '',
    'Last Name': '',
    'Date of Birth': '',
    'Email': '',
    'Address': '',
    'Social Media Handles': '',
    // 'LinkedIn Profile': '',
  };

  final Map<String, IconData> fieldIcons = {
    'First Name': Icons.person,
    'Last Name': Icons.person_outline,
    'Date of Birth': Icons.calendar_today,
    'Email': Icons.email,
    'Address': Icons.location_on,
    'Social Media Handles': Icons.share,
    // 'LinkedIn Profile': Icons.business_center,
  };

  File? _profileImage;
  String? _downloadUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    final user = _auth.currentUser;
    if (user != null) {
      // Fetch details from Firebase Authentication
      final displayName = user.displayName?.split(" ") ?? ["", ""];
      final email = user.email ?? "";

      userDetails['First Name'] = displayName.isNotEmpty ? displayName[0] : '';
      userDetails['Last Name'] = displayName.length > 1 ? displayName[1] : '';
      userDetails['Email'] = email;

      // Fetch additional details from Firestore
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        setState(() {
          userDetails.addAll(Map<String, String>.from(doc.data()!));
          _downloadUrl = userDetails['Profile Picture'];
        });
      } else {
        // Save initial details to Firestore if not already saved
        await _firestore.collection('users').doc(user.uid).set({
          ...userDetails,
          'Profile Picture': '',
        });
      }
    }
  }

  Future<void> _updateUserDetails() async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update(userDetails);
    }
  }

  Future<void> _uploadProfilePicture() async {
    if (_profileImage == null) return;

    final user = _auth.currentUser;
    if (user != null) {
      final storageRef =
          _storage.ref().child('profile_pictures/${user.uid}.jpg');
      await storageRef.putFile(_profileImage!);

      final downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        _downloadUrl = downloadUrl;
        userDetails['Profile Picture'] = downloadUrl;
      });

      await _updateUserDetails();
    }
  }

  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });

      await _uploadProfilePicture();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                border: Border.all(
                  color: theme.colorScheme.secondary.withOpacity(0.3),
                  width: 1.0,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: theme.colorScheme.onPrimary,
                        backgroundImage: _downloadUrl != null
                            ? NetworkImage(_downloadUrl!)
                            : null,
                        child: _downloadUrl == null
                            ? Icon(
                                Icons.person,
                                size: 55,
                                color: theme.colorScheme.onBackground,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt,
                                color: theme.colorScheme.onPrimary),
                            onPressed: _pickProfileImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Profile',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    'Fill in your details below',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: userDetails.keys.map((key) {
                      return ProfileDetail(
                        label: key,
                        icon: fieldIcons[key] ?? Icons.info,
                        value: userDetails[key]!,
                        onTap: () => _editField(context, key),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            // Save Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await _updateUserDetails();
                  _showSnackbar(context, "Details saved successfully!");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text('Save Details'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuthMethods(FirebaseAuth.instance)
                      .signOut(context);
                  _showSnackbar(context, "Logged out succesfully!");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text('Sign Out '),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editField(BuildContext context, String label) {
    final TextEditingController controller = TextEditingController();
    controller.text = userDetails[label] ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  userDetails[label] = controller.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Theme.of(context).colorScheme.primary,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileDetail({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(label),
      subtitle: Text(value.isNotEmpty ? value : 'Tap to add $label'),
      trailing: Icon(Icons.arrow_forward_ios, color: theme.colorScheme.primary),
      onTap: onTap,
    );
  }
}
