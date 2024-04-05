import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    // ignore: avoid_print
    await Future.delayed(const Duration(seconds: 2), () => {print("Welcome")});
    Navigator.pushReplacementNamed(context, '/login');
  }

  // TODO CHECK IF THE USER IS LOGGED IN 

  /// if the user us logged in ,
  ///  navigate hime to the list of student 
  /// if not logged in navigate him to the loggin page 
  /// 
  ///


  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 50.0,
                        backgroundColor: Colors.white,
                      ),
              SizedBox( height:  20 ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
