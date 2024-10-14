import 'package:flutter/material.dart';
import 'package:musicapp_final/models/RegistrationModel.dart';
import 'package:provider/provider.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:musicapp_final/screens/BUS/bushome_screen.dart';
import 'package:musicapp_final/screens/LYKN/lyknhome_screen.dart';
import 'package:musicapp_final/screens/register_screen.dart';
import 'package:musicapp_final/screens/search_screen.dart';
import 'package:musicapp_final/screens/signin_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrationModel(), // กำหนด Provider ที่นี่
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SigninScreen(), 
          '/register': (context) => RegisterScreen(),
          '/search': (context) => SearchScreen(),
          '/bushome': (context) => BushomeScreen(),
          '/lyknhome': (context) => LyknhomeScreen(),
        },
      ),
    );
  }
}
