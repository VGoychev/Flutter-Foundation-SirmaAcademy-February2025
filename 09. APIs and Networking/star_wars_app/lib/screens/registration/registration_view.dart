import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/registration/registration_state.dart';
import 'package:star_wars_app/utils/form_validation.dart';
import 'package:star_wars_app/widgets/custom_textfield.dart';

class RegistrationView extends StatelessWidget {
  final RegistrationState state;

  const RegistrationView(this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: state.formKey,
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.transparent
                  ],
                  stops: [0.0, 0.5, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/img/registration.jpeg',
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Center(
                child: Text(
                  'A new force awakens... Identify yourself to continue!',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: CustomTextfield(
                controller: state.nameCtrl,
                validator: FormValidation.validateName,
                label: 'Enter your name.',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: state.submitForm,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('Start your journey, now!',
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
