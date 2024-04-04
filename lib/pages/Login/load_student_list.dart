import 'package:parent_app_v3/pages/Login/Auth_service.dart';
import 'package:parent_app_v3/pages/children_page/children_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadChildren {
  static Future<List<Child>> fetchChildren(String token) async {
    // final response = await http.get(
    //   Uri.parse(''),
    //   // headers: {'Authorization': 'Bearer $token'},
    // );
    AuthService service = AuthService();
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8783/api/v1/student/parentEmail/students'),
      headers: {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({"email": 'nshimiyimanaadolphe@gmail.com'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      final List<Child> children = jsonResponse.map((data) {
        return Child(
          studentID: data['studentID'],
          studentName: data['name'],
          studentLastName: data['lastName'],
          studentFirstName: data['firstName'],
          classId: data['classId'],
          className: data['className'],
          classLevel: data['classLevel'],
          schoolName: data['schoolName'],
          schoolID: data['SchoolID'],
        );
      }).toList();

      return children;
    } else {
      throw Exception('Failed to load children ${response.statusCode}');
    }

    //Fetch children list  from the database
  }
}
