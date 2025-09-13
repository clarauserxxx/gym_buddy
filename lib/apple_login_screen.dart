import 'package:flutter/material.dart';

class AppleLoginScreen extends StatelessWidget {
  const AppleLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mit Apple ID anmelden'),
      ),
      body: const Center(
        child: Text('Apple-ID-Anmeldung folgt...'),
      ),
    );
  }
}
