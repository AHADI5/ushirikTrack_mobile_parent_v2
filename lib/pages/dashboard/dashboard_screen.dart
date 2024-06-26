import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:parent_app_v3/pages/dashboard/dashoard_service.dart';
import 'package:parent_app_v3/pages/dashboard/data.dart';
import 'package:parent_app_v3/pages/dashboard/date_conversion.dart';

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
  //Fetch communication data
  late Future<List<Communication>> _communicationsFuture;
  @override
  void initState() {
    super.initState();
    //Load data
    _communicationsFuture =
        DashboardService.fetchCommunications(widget.schoolID);

    print(_communicationsFuture);
  }

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
                  child: const Text("Voir Plus"),
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
                  child: FutureBuilder<List<Communication>>(
                      future: _communicationsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          List<Communication>? communications = snapshot.data;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: communications?.length ??
                                0, // Replace 5 with the actual number of communications
                            itemBuilder: (context, index) {
                              Communication communication =
                                  communications![index];

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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(communication.title),
                                      //Display one part of the communication content
                                      Text(
                                          '${communication.content.substring(0, 15)}...'),
                                      //Display date time in the form of , one hour ago , two hours ago 
                                      Text(relativeTime(
                                          communication.publishedDate)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
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

      //the bottom navigation menu
      /**
       * this will help the parent to navigate to principal
       * pages of the app , dashboard, communication page , 
       * homework and upshots
       *  */
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), label: 'Communiqués'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Devoirs'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Discipline'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        useLegacyColorScheme: true,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (int index) {
          switch (index) {
            case 0:
              //TODO NAVIGATE TO HOME PAGE
              break;
            case 1:
              //TODO NAVIGATE TO COMMUNIQUE PAGE
              break;
            case 2:
              //TODO NAVIGATE TO DEVOIRS PAGE
              break;
            case 3:
              //TODO NAVIGATE TO NOTES PAGE
              break;
            case 4:
              //TODO NAVIGATE TO DISCIPLINE PAGE
              break;

            default:
          }
        },
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
