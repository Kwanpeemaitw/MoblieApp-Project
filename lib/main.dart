
import 'package:flutter/material.dart';
import 'package:musicapp_final/screens/dashboard_screen.dart';
import 'package:musicapp_final/screens/register_screen.dart';
import 'package:musicapp_final/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SigninScreen(), 
        // '/': (context) => LovesongScreen(), 
        // '/': (context) => SadsongScreen(), 
        '/register': (context) => RegisterScreen(),
        '/dashboard': (context) => DashboardScreen(),

      },
      // home: const LoginScreen(),
    );
  }
}
