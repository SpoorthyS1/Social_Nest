import 'package:flutter/material.dart';
import 'package:social_nest/pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('User registered: ${userCredential.user?.email}');

      // Navigate to HomePage after successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Show error messages
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'This email is already in use.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak.';
      } else {
        errorMessage = 'An error occurred: ${e.message}';
      }

      // Show a snackbar with the error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      // Handle any other errors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An unknown error occurred.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F3FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'READY TO JOIN US? BE PART OF A COMMUNITY BUILT ON SUPPORT, GROWTH, AND MEANINGFUL CONNECTIONS.',
                    style: TextStyle(
                      color: Color(0xFF6A0DAD),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // First Name and Last Name
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) => value == null || value.isEmpty
                                  ? 'First Name is required'
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) => value == null || value.isEmpty
                                  ? 'Last Name is required'
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Username
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.account_circle),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Username is required'
                            : null,
                      ),
                      const SizedBox(height: 10),

                      // Email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),

                      // Phone Number
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Phone number is required'
                            : null,
                      ),
                      const SizedBox(height: 10),

                      // Password
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDAB9FF),
                            foregroundColor: Colors.teal,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              createUserWithEmailAndPassword(context);
                            }
                          },
                          child: Text('Create Account'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
