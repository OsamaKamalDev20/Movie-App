import 'package:flutter/material.dart';

// Movie App UI color pallet
const movieScaffoldBackground = Color(0xFF0D0D0D);
const movieIconColor = Color(0xFFFFD700);
const movieHeadingColor = Color(0xFFFFFFFF);
const movieSubHeadingColor = Color(0xFFE50914);
const movieDescriptionColor = Color(0xFFB3B3B3);
const movieButtonColor = Color(0xFFE50914);

// Movie App UI text-styles
ThemeData get movieTheme => ThemeData(
      scaffoldBackgroundColor: movieScaffoldBackground,
      primaryColor: movieHeadingColor,
      iconTheme: IconThemeData(color: movieIconColor),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: movieHeadingColor,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: movieHeadingColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: movieDescriptionColor,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: movieHeadingColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: movieButtonColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
