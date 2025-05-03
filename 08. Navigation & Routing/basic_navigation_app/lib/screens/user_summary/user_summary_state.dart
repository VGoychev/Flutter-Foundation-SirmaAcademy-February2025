import 'package:basic_navigation_app/model/Person.dart';
import 'package:basic_navigation_app/screens/user_summary/user_summary_view.dart';
import 'package:flutter/material.dart';

class UserSummary extends StatefulWidget {
  final Person person;

  const UserSummary({required this.person, super.key});
  @override
  State<StatefulWidget> createState() => UserSummaryState();
}

class UserSummaryState extends State<UserSummary> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController lastNameCtrl;
  String lastName = '';
  late Person person;

  @override
  void initState() {
    super.initState();
    person = widget.person;
    lastNameCtrl = TextEditingController();
  }

  void onSubmit() {
    setState(() {
      lastName = lastNameCtrl.text;
      person.lastName = lastName;
    });
    lastNameCtrl.clear();
  }

  @override
  void dispose() {
    lastNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserSummaryView(this);
  }
}
