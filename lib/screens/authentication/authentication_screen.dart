import 'package:flutter/material.dart';

//Utils
import '../../utils/text_styles.dart';
//Screens
import './sign_in.dart';
import './sign_up.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = '/authentication';
  AuthenticationScreen({Key? key}) : super(key: key);

  final views = [
    const SignInScreen(),
    const SignUpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height * 0.3),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.07,
                  child: const TabBar(
                    labelColor: primaryColor,
                    indicatorColor: primaryColor,
                    labelPadding: EdgeInsets.all(10),
                    labelStyle: tabBarTextStyle,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                    indicatorWeight: 3,
                    tabs: [
                      Text('Login'),
                      Text('Sign-up'),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.63,
                  child: TabBarView(
                    children: views,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
