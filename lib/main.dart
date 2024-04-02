import 'package:flutter/material.dart';
import 'package:parent_app_v3/pages/Login/login_form.dart';
import './pages/loading_screen.dart';
import './pages/children_page/children_page.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: '/login',
    routes: {
      '/': (context) => const Loading(),
      '/login': (context) => const LoginForm(),
      '/children': (context) => const ChildrenList()
    },
  ));
}
