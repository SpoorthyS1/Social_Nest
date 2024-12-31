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
