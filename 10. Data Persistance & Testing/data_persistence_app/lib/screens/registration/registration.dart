import 'package:data_persistence_app/screens/home/home.dart';
import 'package:data_persistence_app/screens/registration/registration_view.dart';
import 'package:data_persistence_app/services/auth_service.dart';
import 'package:data_persistence_app/services/shared_prefs_service.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  const Registration(
      {super.key, required this.onToggleTheme, required this.themeMode});

  @override
  State<StatefulWidget> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  final SharedPrefsService _prefsService = SharedPrefsService();
  late final TextEditingController nameCtrl, passCtrl, emailCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  String? _errorMessage;
  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController();
    passCtrl = TextEditingController();
    emailCtrl = TextEditingController();

    _initPrefs();
  }

  Future<void> _initPrefs() async {
    await _prefsService.init();
  }

  void submitForm() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        final email = emailCtrl.text.trim();
        final password = passCtrl.text;
        final name = nameCtrl.text;

        await _authService.signUp(email, password);

        await _prefsService.setString('user_name', name);
        await _prefsService.setString('user_password', password);

        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_) => Home(
                    onToggleTheme: widget.onToggleTheme,
                    themeMode: widget.themeMode)),
          );
          nameCtrl.clear();
          passCtrl.clear();
          emailCtrl.clear();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving data: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationView(this);
  }
}
