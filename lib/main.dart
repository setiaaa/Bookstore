import 'package:bookstore/page/data_book.dart';
import 'package:bookstore/page/item_card.dart';
import 'package:bookstore/page/register.dart';
import 'package:bookstore/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookstore/page/home_page.dart';
import 'package:bookstore/page/login_page.dart';
import 'package:bookstore/page/add_book.dart';

import 'firebase_options.dart';
import 'page/edit_book.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(),
        'add_book': (context) => AddBook(),
        'data_book': (context) => DataBook(),
        'edit_book' : (context) => EditBook(),
      },
    );
  }
}
