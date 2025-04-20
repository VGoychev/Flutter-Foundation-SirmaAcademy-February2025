import 'package:flutter/material.dart';
import 'package:input_fields_app/page/home_page_state.dart';
import 'package:input_fields_app/utils/form_validators.dart';
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
          CustomSwitch(value: state.switchValue, onChanged: state.toggleSwitch),
          Text(state.switchText),
          Text('Live input: ${state.currentText}'),
          Form(
            key: state.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                UsernameInput(
                  controller: state.usernameController,
                  labelText: 'Full Name',
                  validator: FormValidators.validateName,
                ),
                const SizedBox(
                  height: 16,
                ),
                UsernameInput(
                  controller: state.passwordController,
                  labelText: 'Password',
                  validator: FormValidators.validatePassword,
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                UsernameInput(
                  controller: state.emailController,
                  labelText: 'Email address',
                  validator: FormValidators.validateEmail,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomCheckbox(
                    value: state.agreedToTerms,
                    onChanged: state.setAgreement,
                    label: 'I agree to terms & conditions.'),
                const SizedBox(
                  height: 16,
                ),
                CustomRadioButton(
                    options: state.fruit,
                    selected: state.pickedFruit,
                    onChanged: state.setFruit),
              ],
            ),
          ),
          GestureDetector(
            onTap: state.tapContainer,
            onHorizontalDragUpdate: state.handleSwipe,
            onLongPress: state.longPressContainer,
            child: Container(
              width: 150,
              height: 150,
              color: state.currentColor,
              child: Center(
                child: Text(state.containerText),
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child:
            SubmitButton(onPressed: !state.isEnabled ? null : state.submitForm),
      ),
    );
  }
}
