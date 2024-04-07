import 'package:flutter/material.dart';
import 'package:parent_app_v3/pages/Login/Auth_service.dart';
import 'package:parent_app_v3/pages/Login/load_student_list.dart';
import 'package:parent_app_v3/pages/children_page/children_page.dart';

// import 'package:parent_app_v3/pages/children_page/children_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //getting data Entered by user
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final AuthService _authService = AuthService();
  final bool _isNotValidate = false;
  bool _passwordVisible = false;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      //Log the user in 
      await _authService.login(
          emailController.text, passWordController.text);
 
      // print('the token content :  ${JwtDecoder.decode(newToken!)}');

      //get children list
      final token = await _authService.getToken();
      if (token != null) {
        // Get children list

        print("Your token is $token");
        final children = await LoadChildren.fetchChildren(token);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChildrenList(children: children)));
      } else {
        // Handle case where token is null
        // For example, show a message or prompt the user to log in again
        print("Token is null");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to login $e'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                        backgroundColor: Colors.white,
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
                      onPressed: _isLoading ? null : _login,
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
