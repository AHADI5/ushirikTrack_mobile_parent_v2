import 'package:flutter/material.dart';
import 'package:parent_app_v3/pages/children_page/children_service.dart';

class ChildrenList extends StatefulWidget {
  final List<Child> children;
  const ChildrenList({super.key, required this.children});

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vos enfant'),
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              final child = widget.children[index];
              return ListTile(
                title: Text(child.studentFirstName),
                subtitle: Text(child.studentLastName),
              );
            }));
  }
}
