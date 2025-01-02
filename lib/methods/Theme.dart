// import 'package:flutter/material.dart';

// class AppTheme {
//   static ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: const Color(0xFFe63946), // Red
//     colorScheme: ColorScheme.light(
//       primary: const Color(0xFFe63946), // Red
//       secondary: const Color(0xFF2a9d8f), // Green (Teal)
//     ),
//     scaffoldBackgroundColor: const Color(0xFFF1FAEE), // Soft Light Background
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.white70, // Red for AppBar
//       elevation: 4,
//       iconTheme: IconThemeData(color: Colors.white),
//       titleTextStyle: TextStyle(
//         color: const Color(0xFFe63946),
//         fontWeight: FontWeight.bold,
//         fontSize: 20,
//       ),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Color(0xFF2a9d8f), // Green for FAB
//       foregroundColor: Colors.white,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.white70, // Dark Gray
//       selectedItemColor: Color(0xFFe63946), // Green for selected items
//       unselectedItemColor: Colors.grey,
//     ),
//     textTheme: const TextTheme(
//       displayLarge: TextStyle(
//         fontSize: 32.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.white, // White Text
//       ),
//       displayMedium: TextStyle(
//         fontSize: 24.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.white, // White Text
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 16.0,
//         color: Colors.white70, // Slightly Greyed White
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 14.0,
//         color: Colors.white70, // Slightly Greyed White
//       ),
//       labelLarge: TextStyle(
//         fontSize: 16.0,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFF2a9d8f), // Green for Labels
//       ),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor:
//             const Color.fromARGB(255, 227, 186, 189), // Soft pinkish-red color
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       ),
//     ),
//     inputDecorationTheme: const InputDecorationTheme(
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         borderSide: BorderSide(color: Color(0xFFe63946), width: 2.0),
//       ),
//       hintStyle: TextStyle(color: Colors.grey),
//       prefixIconColor: Color(0xFFe63946), // Red prefix icon color
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         foregroundColor: const Color(0xFFe63946),
//         disabledForegroundColor:
//             Colors.grey.withOpacity(0.38), // Disabled button color
//         textStyle: const TextStyle(fontWeight: FontWeight.bold),
//       ),
//     ),
//   );

//   static ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: const Color(0xFFe63946), // Red
//     colorScheme: ColorScheme.dark(
//       primary: const Color(0xFFe63946), // Red
//       secondary: const Color(0xFF2a9d8f), // Green (Teal)
//     ),
//     scaffoldBackgroundColor: const Color(0xFF1a1a1a), // Dark Background
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Color(0xFF333333), // Dark Gray AppBar
//       titleTextStyle: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 20,
//       ),
//       iconTheme: IconThemeData(color: Colors.white),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Color(0xFF2a9d8f), // Green for FAB
//       foregroundColor: Colors.white,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Color(0xFF333333), // Dark Gray
//       selectedItemColor: const Color(0xFFe63946), // Green for selected items
//       unselectedItemColor: Colors.grey,
//     ),
//     textTheme: const TextTheme(
//       displayLarge: TextStyle(
//         fontSize: 32.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.white, // White Text
//       ),
//       displayMedium: TextStyle(
//         fontSize: 24.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.white, // White Text
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 16.0,
//         color: Colors.white70, // Slightly Greyed White
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 14.0,
//         color: Colors.white70, // Slightly Greyed White
//       ),
//       labelLarge: TextStyle(
//         fontSize: 16.0,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFF2a9d8f), // Green for Labels
//       ),
//     ),
//     buttonTheme: ButtonThemeData(
//       buttonColor: const Color(0xFFe63946), // Red Buttons
//       textTheme: ButtonTextTheme.primary,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//     ),
//     inputDecorationTheme: const InputDecorationTheme(
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         borderSide: BorderSide(color: Color(0xFFe63946), width: 2.0),
//       ),
//       hintStyle: TextStyle(color: Colors.grey),
//       prefixIconColor: Color(0xFFe63946), // Red prefix icon color
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         foregroundColor: Colors.white,
//         disabledForegroundColor:
//             Colors.grey.withOpacity(0.38), // Disabled button color
//         textStyle: const TextStyle(fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFe63946), // Red
    colorScheme: ColorScheme.light(
      primary: const Color(0xFFe63946), // Red
      secondary: const Color(0xFF2a9d8f), // Green (Teal)
    ),
    scaffoldBackgroundColor: const Color(0xFFF1FAEE), // Soft Light Background
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white70, // Red for AppBar
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: const Color(0xFFe63946),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF2a9d8f), // Green for FAB
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white70, // Dark Gray
      selectedItemColor: Color(0xFFe63946), // Green for selected items
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Black Text
      ),
      displayMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Black Text
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: Colors.black, // Black Text
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.black, // Black Text
      ),
      labelLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2a9d8f), // Green for Labels
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color.fromARGB(255, 227, 186, 189), // Soft pinkish-red color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Color(0xFFe63946), width: 2.0),
      ),
      hintStyle: TextStyle(color: Colors.grey),
      prefixIconColor: Color(0xFFe63946), // Red prefix icon color
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFe63946),
        disabledForegroundColor:
            Colors.grey.withOpacity(0.38), // Disabled button color
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFe63946), // Red
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFFe63946), // Red
      secondary: const Color(0xFF2a9d8f), // Green (Teal)
    ),
    scaffoldBackgroundColor: const Color(0xFF1a1a1a), // Dark Background
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF333333), // Dark Gray AppBar
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF2a9d8f), // Green for FAB
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF333333), // Dark Gray
      selectedItemColor: const Color(0xFFe63946), // Green for selected items
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.white // Black Text
          ),
      displayMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Black Text
      ),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white // Black Text
          ),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white // Black Text
          ),
      labelLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2a9d8f), // Green for Labels
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFFe63946), // Red Buttons
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Color(0xFFe63946), width: 2.0),
      ),
      hintStyle: TextStyle(color: Colors.grey),
      prefixIconColor: Color(0xFFe63946), // Red prefix icon color
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        disabledForegroundColor:
            Colors.grey.withOpacity(0.38), // Disabled button color
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
