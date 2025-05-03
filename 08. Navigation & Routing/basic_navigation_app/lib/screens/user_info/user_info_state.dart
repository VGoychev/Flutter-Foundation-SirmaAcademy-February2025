import 'package:basic_navigation_app/model/Person.dart';
import 'package:basic_navigation_app/screens/user_info/user_info_view.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo>{
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    late final TextEditingController nameCtrl;
    String firstName = '';
    String lastName = '';
    late Person person;

  @override
  void initState(){
    super.initState();
    nameCtrl = TextEditingController();
  }

  void onSubmit() {
    setState(() {
      firstName = nameCtrl.text;
      person = Person(firstName: firstName, lastName: lastName);
    });
    nameCtrl.clear();
  }

  @override
  void dispose(){
    nameCtrl.dispose();
    super.dispose();
  }


     @override
  Widget build(BuildContext context) {
    return UserInfoView(this);
  }
}