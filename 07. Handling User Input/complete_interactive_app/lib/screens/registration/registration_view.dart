import 'package:complete_interactive_app/providers/switch_provider.dart';
import 'package:complete_interactive_app/screens/registration/registration_state.dart';
import 'package:complete_interactive_app/utils/form_validation.dart';
import 'package:complete_interactive_app/widgets/custom_checkbox.dart';
import 'package:complete_interactive_app/widgets/custom_switch.dart';
import 'package:complete_interactive_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatelessWidget {
  final RegState state;

  const RegistrationView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up Form'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: state.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CustomSwitch(
                            value: context.watch<SwitchProvider>().value,
                            onChanged: (_) {
                              context.read<SwitchProvider>().ChangeTheme();
                            }),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextfield(
                          controller: state.nameCtrl,
                          validator: FormValidation.validateName,
                          label: 'Name',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextfield(
                          controller: state.emailCtrl,
                          validator: FormValidation.validateEmail,
                          label: 'Email',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextfield(
                          controller: state.passwordCtrl,
                          validator: FormValidation.validatePassword,
                          label: 'Password',
                          obsecure: true,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomCheckbox(
                            value: state.agreedToTerms,
                            onChanged: state.setAgreement,
                            label: 'I agree to the terms & conditions.'),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: state.submitForm,
                          child: Text('Continue'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: state.containerOffset.dx,
            top: state.containerOffset.dy + 100,
            child: GestureDetector(
              onTap: state.onTap,
              onPanUpdate: state.onDragUpdate,
              onPanEnd: (_) {
                state.handleSwipes(DragUpdateDetails(
                  globalPosition: Offset.zero,
                  localPosition: Offset.zero,
                  delta: Offset.zero,
                ));
              },
              onLongPress: state.onLongPress,
              child: Container(
                width: 150,
                height: 150,
                color: state.containerColor,
                child: Center(
                  child: Text(state.containerText),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'X: ${state.containerOffset.dx.toStringAsFixed(0)}, '
                'Y: ${state.containerOffset.dy.toStringAsFixed(0)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
