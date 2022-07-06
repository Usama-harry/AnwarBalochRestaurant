import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Widgets
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_text_field.dart';
//Providers
import '../../providers/auth.dart';
//Utils
import '../../utils/functions.dart';
//Screens
import '../main_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObsecure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController,
                    isObsecure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (value != passwordController.text) {
                        return 'Password do not match';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
          MyElevatedButton(
            text: 'Sign Up',
            function: () {
              if (_formKey.currentState!.validate()) {
                Provider.of<Auth>(context, listen: false)
                    .signUpWithEmailAndPassword(
                        emailController.text, passwordController.text)
                    .then((value) {
                  Navigator.of(context).pushReplacementNamed(
                    MainScreen.routeName,
                  );
                }).catchError((error) {
                  String message = 'Error occured';

                  switch (error.code) {
                    case 'email-already-in-use':
                      message = 'Email already registered. Please Sign In';
                      break;
                    case 'weak-password':
                      message = 'Please use strong password';
                      break;
                  }
                  showMySnackBar(
                    context,
                    Colors.red,
                    message,
                  );
                });
              }
            },
          ),
        ],
      ),
    );
  }

  clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
