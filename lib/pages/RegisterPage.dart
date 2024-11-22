import 'package:flutter/material.dart';
import 'package:social_nest/pages/HomePage.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F3FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,  
        elevation: 0,
      ),
      body: SafeArea(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        child: Container(
          // mainAxisAlignment: MainAxisAlignment.center,
          height: double.infinity,
          width: double.infinity,

          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(colors: [
          //     Color(0xffB81736),
          //     Color(0xff281537),
          //   ]),
          // ),

          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 45),
                  // const Icon(
                  //   Icons.lock,
                  //   size: 50,
                  // ),
                  // const SizedBox(height: 35),
                  CircleAvatar(
                    radius: 50,
                  ),
                  SizedBox(height: 20),

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

                  // MyTextField(
                  //   controller: usernameController,
                  //   hint: 'User Name',
                  //   obscureText: false,
                  // ),

                  // const SizedBox(height: 10),
                  // MyTextField(
                  //   controller: passwordController,
                  //   hint: 'Password',
                  //   obscureText: true,
                  // ),
                  Form(
                    key: _formKey, 
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              // firstname
                              child: TextFormField(
                                expands: false,
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                  prefixIcon: Icon(Icons.person),
                                ),
                                validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First Name is required';
                                }
                                return null;
                              },
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              // lastname
                              child: TextFormField(
                                expands: false,
                                controller: lastNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Name',
                                  prefixIcon: Icon(Icons.person),
                                ),
                                validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Last Name is required';
                                }
                                return null;
                              },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        // username
                        TextFormField(
                          // expands: false,
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.account_circle),
                          ),
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                        ),
                        SizedBox(height: 10),

                        // email
                        TextFormField(
                          // expands: false,
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
                          final emailRegex = RegExp(
                              r'^[^@]+@[^@]+\.[^@]+'); // Basic email validation
                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                        ),
                        SizedBox(height: 10),

                        // phone number
                        TextFormField(
                          // expands: false,
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone',
                            prefixIcon: Icon(Icons.phone),
                          ),
                           keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          }
                          final phoneRegex = RegExp(r'^\d+$'); // Numeric check
                          if (!phoneRegex.hasMatch(value)) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                        ),
                        SizedBox(height: 10),

                        // password
                        TextFormField(
                          // expands: false,
                          obscureText: true,
                          controller: passwordController,
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
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFDAB9FF), // Peach button
                              foregroundColor: Color(0xFF008080),
                            ),
                            onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
                        );
                              // Process form submission
                              print('Form Submitted');
                            }
                          },
                          child: Text('Create account'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Text(
                  //         'Forgot Password?',
                  //         style: TextStyle(color: Colors.blue),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // const SizedBox(height: 25),

                  const SizedBox(height: 15),

                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Divider(
                  //           color: Colors.grey[500],
                  //           thickness: 0.5,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding:
                  //             const EdgeInsets.symmetric(horizontal: 5.0),
                  //         child: Text('Or continue with'),
                  //       ),
                  //       Expanded(
                  //         child: Divider(
                  //           color: Colors.grey[500],
                  //           thickness: 0.5,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // const SizedBox(height: 15),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         // Wrap Image in a Container to use decoration
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.white),
                  //           borderRadius: BorderRadius.circular(6),
                  //           color: Colors.grey[200],
                  //         ),
                  //         child: Image.asset('lib/images/apple2.png',
                  //             height: 30, width: 50),
                  //       ),
                  //     ),
                  //     SizedBox(width: 10),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         // Wrap Image in a Container to use decoration
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.white),
                  //           borderRadius: BorderRadius.circular(6),
                  //           color: Colors.grey[200],
                  //         ),
                  //         child: Image.asset('lib/images/google1.png',
                  //             height: 30, width: 50),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
