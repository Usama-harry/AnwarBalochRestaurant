import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Widgets
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_text_field.dart';
//Screens
import '../main_screen.dart';
//Providers
import '../../providers/auth.dart';
//Utils
import '../../utils/functions.dart';

enum LoginMode {
  signIN,
  reset,
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginMode mode = LoginMode.signIN;

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                    height: mode == LoginMode.signIN ? 80 : 0,
                    child: MyTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      isObsecure: true,
                      validator: mode == LoginMode.signIN
                          ? (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            }
                          : (value) => null,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      switchLoginMode();
                    },
                    child: Text(
                      mode == LoginMode.signIN
                          ? 'Forgot password?'
                          : 'Sign In ',
                    ),
                  )
                ],
              ),
            ),
          ),
          MyElevatedButton(
              text: mode == LoginMode.signIN ? 'Sign In' : 'Reset',
              function: () {
                if (_formKey.currentState!.validate()) {
                  if (mode == LoginMode.signIN) {
                    signIn();
                  } else {
                    resetPassword();
                  }
                }
              }),
        ],
      ),
    );
  }

  resetPassword() {
    Provider.of<Auth>(context, listen: false)
        .resetPassword(
      emailController.text,
    )
        .then((value) {
      showMySnackBar(context, Colors.green, 'Reset email sent');
    }).catchError((error) {
      String message = 'Error occured';

      switch (error.code) {
        case 'invalid-email':
          message = 'Account with this email not found';
          break;
      }

      showMySnackBar(
        context,
        Colors.red,
        message,
      );
    });
  }

  signIn() {
    Provider.of<Auth>(context, listen: false)
        .signInWithEmailAndPassword(
            emailController.text, passwordController.text)
        .then((value) {
      Navigator.of(context).pushReplacementNamed(
        MainScreen.routeName,
      );
    }).catchError((error) {
      String message = 'Error occured';

      switch (error.code) {
        case 'user-not-found':
          message = 'Account not found. Please register';
          break;
        case 'wrong-password':
          message = 'Wrong password';
          break;
      }
      showMySnackBar(
        context,
        Colors.red,
        message,
      );
    });
  }

  switchLoginMode() {
    setState(() {
      if (mode == LoginMode.signIN) {
        mode = LoginMode.reset;
      } else {
        mode = LoginMode.signIN;
      }
    });
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
