import 'package:complete_interactive_app/screens/registration/registration_view.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegState();
}

class RegState extends State<Registration> {
  late final TextEditingController nameCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController passwordCtrl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Offset containerOffset = Offset(0, 500);
  bool agreedToTerms = false;
  String containerText = '';
  Color containerColor = Colors.teal;
  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  void onTap() {
    setState(() {
      containerText = 'Tapped!';
    });
  }

  void onDragUpdate(DragUpdateDetails details) {
    setState(() {
      double newX = containerOffset.dx + details.delta.dx;
      double newY = containerOffset.dy + details.delta.dy;
      
      // Constrain X position (0 to screen width - container width)
      newX = newX.clamp(0.0, MediaQuery.of(context).size.width - 150);
      
      // Only allow dragging below the form area (approximately 500 pixels)
      // The +100 accounts for the initial offset
      newY = newY.clamp(320.0, MediaQuery.of(context).size.height - 150);
      
      containerOffset = Offset(newX, newY);
    });
  }

  void handleSwipes(DragUpdateDetails details) {
    setState(() {
      if (details.delta.dx < 0) {
        containerText = 'Swiped Left!';
        containerColor = Colors.red;
      } else if (details.delta.dx > 0) {
        containerText = 'Swiped Right';
        containerColor = Colors.blue;
      }
    });
  }

  void onLongPress() {
    setState(() {
      containerColor = Colors.green;
      containerText = 'Long Press Detected!';
    });
  }

  void submitForm() {
    if (formKey.currentState!.validate() && agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Registration successful!',
          ),
        ),
      );
      nameCtrl.clear();
      emailCtrl.clear();
      passwordCtrl.clear();
      setAgreement(null);
    } else if (!agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You must agree to the terms & conditions!')));
    }
  }

  void setAgreement(bool? value) =>
      setState(() => agreedToTerms = value ?? false);

  @override
  Widget build(BuildContext context) {
    return RegistrationView(this);
  }
}
