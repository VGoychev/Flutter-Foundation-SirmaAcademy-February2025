import 'package:data_persistence_app/screens/registration/registration.dart';
import 'package:data_persistence_app/utils/validations/form_validation.dart';
import 'package:data_persistence_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegistrationView extends StatelessWidget {
  final RegistrationState state;
  const RegistrationView(this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = state.widget.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: state.widget.onToggleTheme,
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              color: isDarkMode
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
              size: 36,
            ),
          ),
        ],
      ),
      body: Form(
          key: state.formKey,
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'My Daily Mood',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26),
                Container(
                  height: 300,
                  child: Image.asset('assets/images/mood-gif.gif'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextfield(
                    controller: state.emailCtrl,
                    validator: FormValidation.validateEmail,
                    label: 'Your email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextfield(
                    controller: state.nameCtrl,
                    validator: FormValidation.validateName,
                    label: 'Your name',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextfield(
                    controller: state.passCtrl,
                    validator: FormValidation.validatePassword,
                    label: 'Your password',
                    obsecure: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    onPressed: state.submitForm,
                    child: Text('Register'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
