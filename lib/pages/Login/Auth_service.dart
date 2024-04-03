import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _tokenKey = 'token';

  Future<bool> isLoggedIn() async {
    /**
     * This function verifies whether the user is logged in
     * it returns a boolean after checking the token existance
     */
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    return token != null;
  }

  Future<String?> getToken() async {
    /**
     * this function look for the token and retrieve it if it is not
     * yet deleted from the user storage
     */
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://your-authentication-endpoint.com/login'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
      );

      if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
    } else {
      throw Exception('Failed to login');
    }
  }

   Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
