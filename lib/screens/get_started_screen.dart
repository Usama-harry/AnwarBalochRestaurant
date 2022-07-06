import 'package:flutter/material.dart';

//Utils
import '../utils/text_styles.dart';
//Screens
import './authentication/authentication_screen.dart';
//Widgets
import '../widgets/my_elevated_button.dart';

class GetStartedScreen extends StatelessWidget {
  static const routeName = '/get-started';
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3A1A1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  'Anwar Baloch',
                  style: getStartedTitleTextStyle,
                ),
                const Text(
                  'Restaurant and Fast Food',
                  style: getStartedSubTitleTextStyle,
                ),
              ],
            ),
          ),
          MyElevatedButton(
            text: 'Get started',
            function: () => Navigator.of(context)
                .pushReplacementNamed(AuthenticationScreen.routeName),
          )
        ],
      ),
    );
  }
}
