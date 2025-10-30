import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _checking = false;

  Future<void> _login() async {
    setState(() => _checking = true);
    final prefs = await SharedPreferences.getInstance();
    final savedUser = prefs.getString('saved_username');
    final savedPass = prefs.getString('saved_password');

    await Future.delayed(const Duration(milliseconds: 300)); // küçük bekleme UX için
    setState(() => _checking = false);

    if (savedUser == null || savedPass == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kayıtlı kullanıcı yok. Lütfen önce kayıt olun.')),
      );
      return;
    }

    final enteredUser = _userCtrl.text.trim();
    final enteredPass = _passCtrl.text;

    if (enteredUser == savedUser && enteredPass == savedPass) {
      // başarılı
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Giriş Hatası'),
          content: const Text('Kullanıcı adı veya parola hatalı.'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tamam')),
          ],
        ),
      );
    }
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
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userCtrl, decoration: const InputDecoration(labelText: 'Kullanıcı adı')),
            const SizedBox(height: 12),
            TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Parola'), obscureText: true),
            const SizedBox(height: 20),
            _checking
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: _login, child: const Text('Giriş Yap')),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
