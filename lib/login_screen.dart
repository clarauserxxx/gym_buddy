import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          SizedBox.expand(
            child: Image.asset(
              'assets/images/login_background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Verdunkelung
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // Inhalt
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Abstand nach oben
                const SizedBox(height: 60),

                // Titel
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'GEMEINSAM\nSTÄRKER\nWERDEN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFFC300), // kräftiges Gelb
                      letterSpacing: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Apple Login Button
                _buildButton(
                  context: context,
                  label: 'Mit Apple ID anmelden',
                  icon: Icons.apple,
                  bgColor: Colors.white,
                  textColor: Colors.black,
                ),

                const SizedBox(height: 16),

                // Facebook Login Button
                _buildButton(
                  context: context,
                  label: 'Mit Facebook anmelden',
                  icon: Icons.facebook,
                  bgColor: Color(0xFF1877F2),
                  textColor: Colors.white,
                ),

                const SizedBox(height: 16),

                // Handynummer Login Button
                _buildButton(
                  context: context,
                  label: 'Handynummer verwenden',
                  icon: Icons.phone,
                  bgColor: Colors.white,
                  textColor: Colors.black,
                ),

                const Spacer(),

                // Datenschutzhinweis
                const Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    'Mit deiner Anmeldung akzeptierst du unsere\n'
                    'AGB & Datenschutzrichtlinie. Wir\n'
                    'posten niemals auf Facebook.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Wiederverwendbare Button-Funktion
  static Widget _buildButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: () {
          Navigator.pushReplacementNamed(context, '/'); // Hier kannst du Navigation oder Login-Logik einfügen
          },
          icon: Icon(icon, color: textColor),
          label: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
