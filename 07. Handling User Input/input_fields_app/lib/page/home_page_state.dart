import 'package:flutter/material.dart';
import 'package:input_fields_app/page/home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String currentText = '';
  bool agreedToTerms = false;
  String? pickedFruit;
  List<String> fruit = ['Apple', 'Banana', 'Orange'];
  bool switchValue = false;
  String switchText = 'OFF';
  String email = '';
  Color currentColor = Colors.amber;
  String containerText = '';
  @override
  Widget build(BuildContext context) {
    return HomePageView(this);
  }

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController.addListener(() {
      setState(() {
        currentText = usernameController.text;
      });
    });
  }

  void tapContainer(){
    setState(() {
      currentColor = currentColor == Colors.amber ? Colors.blue : Colors.amber;
      containerText = 'Tapped!';
    });
  }

  void handleSwipe(DragUpdateDetails details){
    setState(() {
      if(details.delta.dx < 0){
      containerText = 'Swiped Left!';
      } else if (details.delta.dx > 0){
        containerText = 'Swiped Right!';
      }
    });
  }

  void longPressContainer(){
    setState(() {
      containerText = 'Long Press Detected!';
    });
  }

  void toggleSwitch(bool value) {
    setState(() {
      switchValue = value;
      switchText = switchValue ? 'ON' : 'OFF';
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Registration successful!',
          ),
        ),
      );
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      setAgreement(null);
      setFruit(null);
    }
  }

  bool get isEnabled {
    return agreedToTerms && pickedFruit != null;
  }

  void setAgreement(bool? value) =>
      setState(() => agreedToTerms = value ?? false);

  void setFruit(String? value) => setState(() => pickedFruit = value);
}
