// import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:social_nest/component/my_button.dart';
// import 'package:social_nest/methods/firebase_auth_methods.dart';
// import 'package:social_nest/pages/HomePage.dart';
// import 'package:social_nest/pages/RegisterPage.dart'; // Import the new service

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF8F3FF),
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 45),
//                 CircleAvatar(
//                   radius: 50,
//                 ),
//                 const SizedBox(height: 35),
//                 Text(
//                   'WELCOME TO YOUR COMMUNITY HUB',
//                   style: TextStyle(
//                     color: Color(0xFF6A0DAD),
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'UserName',
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                       prefixIcon: Icon(Icons.lock),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                           color: Color(0xFF008080),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MyButton(
//                   onTap: () async {
//                     bool isSignedIn =
//                         await FirebaseAuthMethods(FirebaseAuth.instance)
//                             .signUserIn(
//                       emailController.text,
//                       passwordController.text,
//                     );

//                     if (isSignedIn) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomePage()),
//                       );
//                     } else {
//                       print("Sign-in failed");
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: Colors.grey[500],
//                           thickness: 0.5,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: Text('Or continue with'),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: Colors.grey[500],
//                           thickness: 0.5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(width: 10),
//                     TextButton(
//                       onPressed: () {
//                         // Add your button tap functionality here
//                         print("Button clicked!");
//                       },
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero, // Remove extra padding
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         backgroundColor: Colors.grey[200],
//                       ),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Image.asset('assets/apple2.png',
//                             height: 30, width: 50),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     const SizedBox(width: 10),
//                     TextButton(
//                       onPressed: () async {
//                         try {
//                           print("Button clicked!");
//                           await FirebaseAuthMethods(FirebaseAuth.instance)
//                               .signInWithGoogle(context);
//                           print("Sign-In successful");
//                         } catch (e) {
//                           print("Error during Google Sign-In: $e");
//                         }
//                       },
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero, // Remove extra padding
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         backgroundColor: Colors.grey[200],
//                       ),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Image.asset('assets/google1.png',
//                             height: 30, width: 50),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Not a member ?',
//                       style: TextStyle(
//                         fontSize: 15,
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => RegisterPage()),
//                         );
//                       },
//                       child: Text(
//                         'Register Now',
//                         style: TextStyle(
//                           color: Color(0xFF008080),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:social_nest/component/my_button.dart';
import 'package:social_nest/methods/firebase_auth_methods.dart';
import 'package:social_nest/pages/HomePage.dart';

import 'package:social_nest/pages/RegisterPage.dart'; // Import the new service

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F3FF),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 45),
                CircleAvatar(
                  radius: 50,
                ),
                const SizedBox(height: 35),
                Text(
                  'WELCOME TO YOUR COMMUNITY HUB',
                  style: TextStyle(
                    color: Color(0xFF6A0DAD),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'UserName',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF008080),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                MyButton(
                  onTap: () async {
                    bool isSignedIn =
                        await FirebaseAuthMethods(FirebaseAuth.instance)
                            .signUserIn(
                      emailController.text,
                      passwordController.text,
                    );

                    if (isSignedIn) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      print("Sign-in failed");
                    }
                  },
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[500],
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Or continue with'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[500],
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        // Add your button tap functionality here
                        print("Button clicked!");
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Remove extra padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Image.asset('assets/apple2.png',
                            height: 30, width: 50),
                      ),
                    ),
                    SizedBox(width: 10),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () async {
                        try {
                          print("Button clicked!");
                          await FirebaseAuthMethods(FirebaseAuth.instance)
                              .signInWithGoogle(context);
                          print("Sign-In successful");
                        } catch (e) {
                          print("Error during Google Sign-In: $e");
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Remove extra padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Image.asset('assets/google1.png',
                            height: 30, width: 50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member ?',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color(0xFF008080),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}