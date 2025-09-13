import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'onboarding/onboarding_screen.dart';
import 'home_screen.dart';
import 'register_screen.dart';
import 'profile_screen.dart';
import 'phone_login_screen.dart';
import 'apple_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(), // Startseite deiner App
      routes: {
        '/login':(context) => const LoginScreen(),
        '/register':(context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/phoneLogin' : (context) => const PhoneLoginScreen(),
        '/appleLogin': (context) => const AppleLoginScreen(),
     },