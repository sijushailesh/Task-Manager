import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
    statusBarColor: Color(0xffffb969), // status bar color
  ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildAppTheme(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

  // Custom ThemeData using Google Fonts
  ThemeData _buildAppTheme() {
    return ThemeData(
      // primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        // backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            // color: Colors.blueAccent,
          ),
        ),
        titleLarge: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            // color: Colors.blueAccent,
          ),
        ),
        bodyLarge: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
        bodyMedium: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 14.0,
            color: Colors.black54,
          ),
        ),
        bodySmall: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
        labelLarge: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          textStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
