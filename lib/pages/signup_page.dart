import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _saving = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_username', _userCtrl.text.trim());
    await prefs.setString('saved_password', _passCtrl.text); // tekrar: ders için
    setState(() => _saving = false);

    // Bilgilendir
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kayıt başarılı. Giriş yapabilirsiniz.')),
    );
    Navigator.pop(context); // sign up'dan login'e dön
  }

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userCtrl,
                decoration: const InputDecoration(labelText: 'Kullanıcı adı'),
                validator: (v) => (v==null || v.trim().isEmpty) ? 'Kullanıcı adı gerekli' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Parola'),
                obscureText: true,
                validator: (v) => (v==null || v.length < 4) ? 'En az 4 karakter' : null,
              ),
              const SizedBox(height: 20),
              _saving
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _register,
                child: const Text('Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
