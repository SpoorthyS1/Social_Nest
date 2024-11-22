import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile Input',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final Map<String, String> userDetails = {
    'First Name': '',
    'Last Name': '',
    'Date of Birth': '',
    'Email': '',
    'Address': '',
    'Social Media Handles': '',
    'LinkedIn Profile': '',
  };

  final Map<String, IconData> fieldIcons = {
    'First Name': Icons.person,
    'Last Name': Icons.person_outline,
    'Date of Birth': Icons.calendar_today,
    'Email': Icons.email,
    'Address': Icons.location_on,
    'Social Media Handles': Icons.share,
    'LinkedIn Profile': Icons.business_center,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                border: Border.all(
                    color: Colors.teal.withOpacity(0.3),
                    width: 1.0), // Added subtle teal border
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/default_profile.png'),
                          child: Icon(Icons.person, size: 55),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            onPressed: () {
                              print("Add/Edit Profile Picture");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fill in your details below',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
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

            // Additional Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Details Saved: $userDetails");
                      _showSnackbar(context, "Details saved successfully!");
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.purpleAccent,
                      padding: EdgeInsets.all(16.0),
                      side: BorderSide(
                          color: Colors.teal.withOpacity(
                              0.3)), // Subtle teal border for button
                    ),
                    child: Text('Save Details'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("Viewing Transaction History");
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.all(16.0),
                      side: BorderSide(
                          color: Colors.teal.withOpacity(
                              0.3)), // Subtle teal border for button
                    ),
                    child: Text(
                      'View Transaction History',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      print("Log Out");
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Colors.purpleAccent),
                      padding: EdgeInsets.all(16.0),
                    ),
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editField(BuildContext context, String label) {
    if (label == 'Date of Birth') {
      _selectDate(context);
    } else {
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
                  borderSide: BorderSide(
                      color: Colors.teal.withOpacity(0.5),
                      width: 1), // Teal border for input fields
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Colors.teal, width: 2), // Teal border when focused
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
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purpleAccent,
            hintColor: Colors.purpleAccent,
            colorScheme: ColorScheme.light(primary: Colors.purpleAccent),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        userDetails['Date of Birth'] =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
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
    return ListTile(
      leading: Icon(icon, color: Colors.purpleAccent),
      title: Text(label),
      subtitle: Text(value.isNotEmpty ? value : 'Tap to add $label'),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.purpleAccent),
      onTap: onTap,
    );
  }
}
