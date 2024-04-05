import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class StudentDashBoard extends StatefulWidget {
  final int schoolID;
  final int classID;
  final int studentID;
  final String name;
  final String classRoom;
  // final bool hasCriticalIncident;

  const StudentDashBoard({
    super.key,
    required this.schoolID,
    required this.classID,
    required this.studentID,
    required this.name,
    required this.classRoom,
    // required this.hasCriticalIncident,
  });

  @override
  State<StudentDashBoard> createState() => _StudentDashBoardState();
}

class _StudentDashBoardState extends State<StudentDashBoard> {
  final List<int> numbers = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Accueil"),
        ),
        actions: [
          Row(
            children: [
              badges.Badge(
                position: badges.BadgePosition.custom(
                  start: 25,
                  end: 10,
                  top: 0,
                  bottom: 10,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // Your onPressed logic here
                  },
                  iconSize: 30,
                ),
              ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(9.0),
                  color: const Color.fromARGB(255, 240, 246, 254),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'ID : ${widget.studentID.toString()}',
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(widget.classRoom),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Aujourd'hui",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.0,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    // color: widget.hasCriticalIncident ? Colors.red[100] : Colors.grey[200],
                    color: const Color.fromARGB(255, 240, 246, 254),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Résumé des activités",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                          fontSize: 14,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to daily activities screen
                        },
                        child: const Text("Voir plus"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Devoirs Récents",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.0,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        5, // Replace 5 with the actual number of homeworks
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Perform action when homework item is tapped
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Homework Title"),
                              Text("Course"),
                              Text("Date Published"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to another screen to show more homeworks
                  },
                  child: Text("Voir Plus"),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Communications Récentes",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.0,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        5, // Replace 5 with the actual number of communications
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Perform action when communication item is tapped
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Communication Title"),
                              Text("Description"),
                              Text("Date Published"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to another screen to show more communications
                  },
                  child: const Text("Voir Plus"),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity, // Take full width
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade400, Colors.blue.shade900],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Événements à venir",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      EventTile(name: "Nom de l'événement", date: "DD/MM/YYYY"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  final String name;
  final String date;

  const EventTile({
    Key? key,
    required this.name,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
