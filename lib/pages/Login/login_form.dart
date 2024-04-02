import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //getting data Entered by user
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passWordController = TextEditingController();

  // void loginUser() async {
  //   if (emailController.text.isNotEmpty && passWordController.text.isEmpty) {
  //     var requestBody = {
  //       "email": emailController.text,
  //       "password": passWordController.text
  //     };

  //     var response = await http.post(Uri.parse("registration"),
  //         headers: {"Content-type": "application/json"},
  //         body: jsonEncode(requestBody));

  //     // var jsonResponse = jsonDecode(response.body);
  //   }
  // }

  //Creating a key that identifies uniquely the form widget
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        key: _formKey,
        //form - logo - login text
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //this is the login header
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: const Center(
                        child: Column(children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 50.0,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 50,
                            letterSpacing: 8.0),
                      )
                    ])),
                  ),

                  //login form - body  with text fields
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextFormField(
                      //The validator receives the text entred by the user
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.shade400),
                        isDense: true,
                        prefixIcon: const Icon(Icons.email),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veuiller entrer votre Email';
                        }
                        return null; // for valid input
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "password",
                        labelStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.shade400),
                        isDense: true,
                        prefixIcon: const Icon(Icons.lock),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      padding: const EdgeInsets.all(13),
                      color: const Color.fromRGBO(66, 160, 237, 1),
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                              'Connexion',
                              style: TextStyle(
                                  letterSpacing: BorderSide.strokeAlignCenter),
                            )),
                          );
                        }
                        Navigator.pushNamed(context, '/children');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Adjust as desired
                      ),
                      child: const Text(
                        "connexion",
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: const Text("Version 1.0 : Beta"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
