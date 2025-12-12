import 'package:flutter/material.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  String _countryCode = '+49';
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  Future<void> _validateAndContinue() async {
    final phone = _phoneCtrl.text.trim();
    final password = _passwordCtrl.text;

    if (phone.isEmpty) {
      _showError('Bitte gib deine Telefonnummer ein.');
      return;
    }
    if (phone.length < 6) {
      _showError('Telefonnummer ist zu kurz.');
      return;
    }
    if (password.isEmpty) {
      _showError('Bitte gib dein Passwort ein.');
      return;
    }
    if (password.length < 6) {
      _showError('Passwort muss mindestens 6 Zeichen haben.');
      return;
    }

    setState(() => _isLoading = true);

    // TODO: Hier später echte Auth einbauen (API/Firebase etc.)
    await Future.delayed(const Duration(milliseconds: 600));

    setState(() => _isLoading = false);

    // ✅ Erfolgreich -> nächste Seite
    // Variante A: Route-Name (empfohlen)
    Navigator.pushReplacementNamed(context, '/home');

    // Variante B: Direkt auf ein Widget navigieren (falls du keine Routes nutzt)
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onChanged: (v) {
                        if (v != null) setState(() => _countryCode = v);
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

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

              const SizedBox(height: 16),

              const Text('Passwort', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextField(
                controller: _passwordCtrl,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Dein Passwort',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),

              const Spacer(),

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
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _validateAndContinue,
        child: _isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.arrow_forward),
      ),
    );
  }
}
