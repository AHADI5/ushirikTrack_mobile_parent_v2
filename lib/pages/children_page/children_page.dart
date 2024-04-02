import 'package:flutter/material.dart';

class ChildrenList extends StatefulWidget {
  const ChildrenList({super.key});

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  //Fetching data

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
      body: ListView(children: const <Widget>[]),
    );
  }
}
