import 'package:flutter/material.dart';
import 'package:sign_bridge/screens/login_screen.dart';
import 'package:sign_bridge/screens/main_wrapper.dart';
import 'package:sign_bridge/screens/onboarding_screen.dart';
import 'package:sign_bridge/theme/app_theme.dart';

void main() {
  runApp(const SignBridgeApp());
}

class SignBridgeApp extends StatelessWidget {
  const SignBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignBridge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainWrapper(),
      },
    );
  }
}
