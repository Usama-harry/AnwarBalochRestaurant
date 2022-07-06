import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

//Screens
import './screens/get_started_screen.dart';
import './screens/authentication/authentication_screen.dart';
import './screens/main_screen.dart';
//Providers
import './providers/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        )
      ],
      builder: (context, child) => MaterialApp(
        title: 'Anwar baloch',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black,
          ),
        ),
        home: const GetStartedScreen(),
        routes: {
          GetStartedScreen.routeName: (context) => const GetStartedScreen(),
          AuthenticationScreen.routeName: (context) => AuthenticationScreen(),
          MainScreen.routeName: (context) => const MainScreen(),
        },
      ),
    );
  }
}
