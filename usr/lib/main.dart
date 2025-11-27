import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/login_screen.dart';
import 'package:couldai_user_app/screens/test_screen.dart';
import 'package:couldai_user_app/screens/result_screen.dart';

void main() {
  runApp(const NextStepApp());
}

class NextStepApp extends StatelessWidget {
  const NextStepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next Step!!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066FF), // Professional Blue
          secondary: const Color(0xFFFF9900), // Energetic Orange
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default, but explicit is good
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/test': (context) => const TestScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
