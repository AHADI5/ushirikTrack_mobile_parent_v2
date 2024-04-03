import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ChildrenList extends StatefulWidget {
  final token;
  const ChildrenList({this.token, super.key});

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  //Fetching data
  late String email;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    print(jwtDecodedToken);
    email = jwtDecodedToken['sub'];
    print(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vos enfants",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(66, 160, 237, 1),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      // body: Text(email),
    );
  }
}
