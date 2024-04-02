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
      body: ListView(children: const <Widget>[
        
      ]),
    );
  }
}
