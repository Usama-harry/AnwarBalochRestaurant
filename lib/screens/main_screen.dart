import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main-screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
    );
  }
}
