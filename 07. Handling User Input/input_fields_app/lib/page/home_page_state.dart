import 'package:flutter/material.dart';
import 'package:input_fields_app/page/home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final TextEditingController usernameController;
  String currentText = '';
  bool agreedToTerms = false;
  String? pickedFruit;
  List<String> fruit = ['Apple', 'Banana', 'Orange'];
  bool switchValue = false;
  String switchText = 'OFF';

   @override
  Widget build(BuildContext context) {
    return HomePageView(this);
  }


  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    usernameController.addListener(() {
      setState(() {
        currentText = usernameController.text;
      });
    });

  }

  void toggleSwitch(bool value){
    setState(() {
      switchValue = value;
      switchText = switchValue ? 'ON' : 'OFF';
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    String message;
    final username = usernameController.text.trim();
    if (username.isEmpty && !agreedToTerms && pickedFruit == null) {
      message = 'Please enter a username, agree to the terms and pick a fruit.';
    } else if (username.isEmpty && !agreedToTerms){
      message = 'Please enter a username and agree to the terms.';
    }else if (username.isEmpty) {
      message = 'Please enter a username!';
    } else if (!agreedToTerms) {
      message = 'User: $username hasn\'t agreed to the terms.';
    } else if (pickedFruit == null) {
      message = 'Please select a fruit';
    }else {
      message = 'Username: $username is correct and you agreed to the terms. The picked fruit is $pickedFruit';
      usernameController.clear();
      setAgreement(false);
      setFruit(null);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void setAgreement(bool? value) =>
      setState(() => agreedToTerms = value ?? false);

  void setFruit(String? value) =>
      setState(() => pickedFruit = value);

}
