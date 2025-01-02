import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:social_nest/methods/Theme.dart';
import 'package:social_nest/methods/firebase_auth_methods.dart';
// import 'package:loginss/pages/register_page.dart';
import 'firebase_options.dart';
import 'package:social_nest/pages/Loginpage.dart';
import 'package:social_nest/pages/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e, stackTrace) {
    print('Error initializing Firebase: $e');
    print('Stacktrace: $stackTrace');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme, // Light Theme
          darkTheme: AppTheme.darkTheme, // Dark Theme
          themeMode: ThemeMode.system,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data != null) {
                  return HomePage();
                }
                return LoginPage();
              })),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return LoginPage();
  }
}
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart' as rootBundle;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:convert';

// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     runApp(const MyApp());
//   } catch (e, stackTrace) {
//     print('Error initializing Firebase: $e');
//     print('Stacktrace: $stackTrace');
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('JSON Upload Test')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               uploadJsonToFirestore(); // Trigger JSON upload
//             },
//             child: const Text('Upload JSON to Firestore'),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // {'file': 'assets/carpenters.json', 'category': 'carpenters'},
// //     {'file': 'assets/electricals.json', 'category': 'electricals'},
// //     {'file': 'assets/foodstalls.json', 'category': 'foodstalls'},
// //     {'file': 'assets/mechanic.json', 'category': 'mechanic'},
// //     {'file': 'assets/medicals.json', 'category': 'medicals'},

// Future<void> uploadJsonToFirestore() async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   List<Map<String, dynamic>> jsonFiles = [
    
//     {'file': 'assets/tutions.json', 'category': 'tutions'},

//   ];

//   for (var file in jsonFiles) {
//     try {
//       print('Loading file: ${file['file']}');
//       String jsonString = await rootBundle.rootBundle.loadString(file['file']);
//       print('Loaded ${file['file']} successfully');

//       // Decode JSON data
//       dynamic jsonData = jsonDecode(jsonString);
//       print('Decoded JSON for ${file['category']}: $jsonData');

//       // Upload to Firestore
//       await firestore.collection('localrequirements').add({
//         'category': file['category'],
//         'data': jsonData,
//       }).then((value) {
//         print('${file['category']} uploaded successfully');
//       }).catchError((error) {
//         print("Error uploading ${file['category']}: $error");
//       });
//     } catch (e) {
//       print('Error loading or uploading ${file['category']}: $e');
//     }
//   }
// }
