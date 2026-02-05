import 'package:flutter/material.dart';
import 'package:sign_bridge/screens/auth/login_screen.dart';
import 'package:sign_bridge/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignBridge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // or ThemeMode.dark based on preference
      home: const LoginScreen(),
    );
  }
}
