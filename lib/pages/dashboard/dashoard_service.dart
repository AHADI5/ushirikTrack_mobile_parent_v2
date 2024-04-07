import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parent_app_v3/pages/Login/Auth_service.dart';
import 'package:parent_app_v3/pages/dashboard/data.dart';
// Import your Communication model

class DashboardService {
  static Future<List<Communication>> fetchCommunications(int schoolID) async {
    final AuthService service = AuthService();
    final token = await service.getToken();
    print("token received in dashboard : $token");

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8745/api/v1/school/$schoolID/communications'),
      headers: {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      // Parse response body and return list of Communication objects
      // late List<Communication> communications = List.empty(growable: true);
      // final List<dynamic> data = jsonDecode(response.body);

      List<Communication> communications = [];

      final List<dynamic> data = jsonDecode(response.body);
      for (dynamic item in data) {
        Communication communication = Communication(
          content: item['content'],
          title: item['title'],
          publishedDate: item['publishedDate'],
          type: item['type'],
        );

        communications.add(communication);
      }

      return communications;
    } else {
      throw Exception('Failed to fetch communications');
    }
    // } catch (e) {
    //   throw Exception('Failed to fetch communications: $e');
    // }
  }
}
