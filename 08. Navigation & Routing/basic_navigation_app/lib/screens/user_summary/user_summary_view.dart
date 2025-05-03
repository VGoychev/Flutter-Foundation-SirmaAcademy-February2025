import 'package:basic_navigation_app/screens/user_summary/user_summary_state.dart';
import 'package:basic_navigation_app/utils/form_validator.dart';
import 'package:basic_navigation_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class UserSummaryView extends StatelessWidget {
  final UserSummaryState state;
  const UserSummaryView(this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: state.formKey,
            child: Column(
              children: [
                CustomTextfield(
                    controller: state.lastNameCtrl,
                    validator: FormValidator.validateName,
                    label: 'Last Name'),
                ElevatedButton(
                  onPressed: () {
                    if (state.formKey.currentState!.validate()) {
                      state.onSubmit();
                    }
                  },
                  child: Text('Submit'),
                ),
                Text(
                    'Person\'s first name: ${state.person.firstName} and last name: ${state.person.lastName}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
