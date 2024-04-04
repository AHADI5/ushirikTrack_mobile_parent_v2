import 'package:flutter/material.dart';
import 'package:parent_app_v3/pages/children_page/children_service.dart';

class ChildrenList extends StatefulWidget {
  final List<Child> children;

  const ChildrenList({Key? key, required this.children}) : super(key: key);

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blue,
        // leading: Container(), // Remove the leading icon
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 15),
              child: Text(
                'Vos enfants',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4.0),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.children.length,
                itemBuilder: (context, index) {
                  final child = widget.children[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? const Color.fromARGB(255, 240, 246, 254)
                            : const Color.fromARGB(255, 240, 246, 254),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 2, right: 5),
                        leading: const CircleAvatar(
                          radius: 35.0,
                          backgroundColor:
                              Colors.grey, // Placeholder avatar color
                          // You can add background image here
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${child.studentName} ${child.studentFirstName}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${child.classLevel}ième ${child.className}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              ' ${child.schoolName}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        trailing: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {
                          // Handle tapping on a child item
                          // You can navigate to a detailed view or perform any other action here
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
