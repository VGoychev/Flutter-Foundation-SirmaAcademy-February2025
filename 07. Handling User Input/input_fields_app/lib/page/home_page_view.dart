import 'package:flutter/material.dart';
import 'package:input_fields_app/page/home_page_state.dart';
import 'package:input_fields_app/widgets/custom_checkbox.dart';
import 'package:input_fields_app/widgets/custom_radio_button.dart';
import 'package:input_fields_app/widgets/custom_switch.dart';
import 'package:input_fields_app/widgets/submit_button.dart';
import 'package:input_fields_app/widgets/username_input.dart';

class HomePageView extends StatelessWidget {
  final HomePageState state;

  const HomePageView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SizedBox.expand(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          UsernameInput(controller: state.usernameController),
          Text('Live input: ${state.currentText}'),
          CustomCheckbox(
              value: state.agreedToTerms,
              onChanged: state.setAgreement,
              label: 'I agree to terms & conditions.'),
          CustomRadioButton(
              options: state.fruit,
              selected: state.pickedFruit,
              onChanged: state.setFruit),
          SubmitButton(onPressed: state.handleSubmit),
          CustomSwitch(value: state.switchValue, onChanged: state.toggleSwitch),
          Text(state.switchText),
        ]),
      ),
    );
  }
}
