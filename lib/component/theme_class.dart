import 'package:flutter/material.dart';

class ThemeClass {
  
  static final Color lightPrimaryColor = Color(0xFFDAB9FF); 
  static final Color accentColor = Color(0xFF008080); 
  static final Color secondaryColor = Color(0xFF6A0DAD); 
  static final Color backgroundColor = Color(0xFFF8F3FF); 

  static final Color darkPrimaryColor = Color(0xFF480032); 
  static final Color darkAccentColor = Color(0xFF00BFAE);  
  static final Color darkSecondaryColor = Color(0xFF9A5DFF);  
  static final Color darkBackgroundColor = Color(0xFF212121);  

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: secondaryColor,
      onPrimary: Colors.black, 
      onSecondary: Colors.white,  
      background: backgroundColor,  
      surface: Colors.white,  
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPrimaryColor, 
        foregroundColor: accentColor, 
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      onPrimary: Colors.white,  
      onSecondary: Colors.black, 
      background: darkBackgroundColor, 
      surface: Colors.grey[800]!, 
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPrimaryColor,  
        foregroundColor: darkAccentColor,  
      ),
    ),
  );
}
