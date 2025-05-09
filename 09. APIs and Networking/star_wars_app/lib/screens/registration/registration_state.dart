import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/registration/registration_view.dart';
import 'package:star_wars_app/screens/path/path_state.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  late final TextEditingController nameCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      name = nameCtrl.text;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Path(name: name),
        ),
      );
      nameCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationView(this);
  }
}
