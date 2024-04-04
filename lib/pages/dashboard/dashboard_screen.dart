import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class StudentDashBoard extends StatefulWidget {
  final int schoolID;
  final int classID;
  final int studentID;
  final String name;
  final String classRoom;
  const StudentDashBoard(
      {super.key,
      required this.schoolID,
      required this.classID,
      required this.studentID,
      required this.name,
      required this.classRoom});

  @override
  State<StudentDashBoard> createState() => _StudentDashBoardState();
}

class _StudentDashBoardState extends State<StudentDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 246, 254),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatar(
              // to do: student background image here
              child: Icon(Icons.person)),
        ),
        actions: [
          Row(
            children: [
              Badge(
                label: const Text("1"),
                child: IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Handle notification button tap
                  },
                ),
              ),
              // this is a small space between popup menu and the bell icon
              PopupMenuButton(itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text('Classe'),
                    //TODO NAVIGATE TO CLASS INFORMATION SCREEN
                  ),
                  const PopupMenuItem(
                    child: Text('Ecole'),
                    //TODO NAVIGATE TO SCHOOL INFORMATION SCREEN
                  ),
                  const PopupMenuItem(
                    child: Text('Eleve'),
                    //TODO NAVIGATE TO SCHOOL INFORMATION
                  ),
                  const PopupMenuItem(
                    child: Text('Préférences'),
                    //TODO NAVIGATE TO SCHOOL INFORMATION
                  ),
                ];
              })
            ],
          ),
        ],
      ),
    );
  }
}
