import 'package:flutter/material.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _phoneCtrl = TextEditingController();
  String _countryCode = '+49';

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Pfeil oben links – funktioniert automatisch mit Navigator.pop()
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Gibst du uns deine\nNummer?',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              const Text(
                'Wir nutzen Telefonnummern nur, um sicherzustellen, '
                'dass alle Leute echt sind.',
                style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.3),
              ),
              const SizedBox(height: 24),

              // Land + Vorwahl
              const Text('Land', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _countryCode,
                      items: const [
                        DropdownMenuItem(value: '+49', child: Text('DE +49')),
                        DropdownMenuItem(value: '+43', child: Text('AT +43')),
                        DropdownMenuItem(value: '+41', child: Text('CH +41')),
                      ],
                      onChanged: (v) => setState(() => _countryCode = v!),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Telefonnummer
              const Text('Telefonnummer', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextField(
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'z. B. 1761234567',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const Spacer(),

              // Datenschutzhinweis optional
              Row(
                children: const [
                  Icon(Icons.lock, size: 16, color: Colors.black45),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Sie erscheint nicht in deinem Profil und wir geben sie niemandem weiter.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),

      // Runder Weiter-Button unten rechts – wie im Screenshot
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Hier verifizieren/weiterleiten (z. B. SMS-Code)
          // Navigator.pushNamed(context, '/verify');
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}