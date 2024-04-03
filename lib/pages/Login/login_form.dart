import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:parent_app_v3/pages/children_page/children_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //getting data Entered by user
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final bool _isNotValidate = false;
  bool _passwordVisible = false;
  bool _isLoading = false;
  //Where to store the token
  // late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // initSharedPref();
  }

  // void initSharedPref() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  // void loginUser() async {
  //   // if (emailController.text.isNotEmpty && passWordController.text.isEmpty) {
  //   var requestBody = {
  //     "email": emailController.text,
  //     "password": passWordController.text
  //   };

  //   var response = await http.post(
  //       Uri.parse('http://10.0.2.2:8850/api/v1/auth/authenticate'),
  //       headers: {"Content-type": "application/json"},
  //       body: jsonEncode(requestBody));

  //   var jsonResponse = jsonDecode(response.body);
  //   print("the response is $jsonResponse");
  //   var myToken = jsonResponse['token'];
  //   print(myToken);
  //   // prefs.setString('token', myToken);
  //   Navigator.push(
  //       // ignore: use_build_context_synchronously
  //       context,
  //       MaterialPageRoute(builder: (context) => ChildrenList(token: myToken)));

  //   // if (jsonResponse['status']) {
  //   //   var myToken = jsonResponse['token'];
  //   //   prefs.setString('token', myToken);
  //   //   Navigator.push(
  //   //       // ignore: use_build_context_synchronously
  //   //       context,
  //   //       MaterialPageRoute(
  //   //           builder: (context) => ChildrenList(token: myToken)));

  //   //   //Navigate to Dashboard
  //   // } else {
  //   //    print("Not found");
  //   // }
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
                      controller: emailController,
                      decoration: InputDecoration(
                          errorText: _isNotValidate
                              ? "Entrer les informations correces"
                              : null,
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontSize: 16, color: Colors.grey.shade400),
                          prefixIcon: const Icon(Icons.email),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextFormField(
                      controller: passWordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          errorText: _isNotValidate
                              ? "Entrer les informations correces"
                              : null,
                          labelText: "password",
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          )),
                      obscureText: !_passwordVisible,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueAccent,
                        ),
                      ),
                      child: SizedBox(
                        width: double
                            .infinity, // Set the button width to match the text fields
                        height: 60,
                        child: Center(
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Connexion',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
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
