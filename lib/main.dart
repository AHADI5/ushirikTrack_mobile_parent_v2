import 'package:flutter/material.dart';
import 'package:parent_app_v3/pages/Login/login_form.dart';
import './pages/loading_screen.dart';
// import './pages/children_page/children_page.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: '/login',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Poppins', // Set default font family to Poppins
      // You can also specify individual font weights or styles if needed
      textTheme: const TextTheme(

          // Add more text styles as needed
          ),
    ),
    routes: {
      '/': (context) => const Loading(),
      '/login': (context) => const LoginForm(),
      
  
    },
  ));
}
