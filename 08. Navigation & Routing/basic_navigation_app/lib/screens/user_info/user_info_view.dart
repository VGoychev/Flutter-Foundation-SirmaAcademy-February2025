import 'package:basic_navigation_app/screens/user_info/user_info_state.dart';
import 'package:basic_navigation_app/screens/user_summary/user_summary_state.dart';
import 'package:basic_navigation_app/utils/form_validator.dart';
import 'package:basic_navigation_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class UserInfoView extends StatelessWidget {
  final UserInfoState state;

  const UserInfoView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Form(
            key: state.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomTextfield(
                    controller: state.nameCtrl,
                    validator: FormValidator.validateName,
                    label: 'Name',
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (state.formKey.currentState!.validate()) {
                          state.onSubmit();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserSummary(person: state.person)));
                        }
                      },
                      child: Text('Submit')),
                )
              ],
            ),
          ),
        ));
  }
}
