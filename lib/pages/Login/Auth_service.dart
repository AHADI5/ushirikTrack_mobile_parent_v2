import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

  String extractMailFormToken(String token) {
    Map<String, dynamic> jwtDecoderToken = JwtDecoder.decode(token);
    String? email = jwtDecoderToken['email'];
    if (email == null) {
      throw Exception('Email not found in token $email');
    }
    print("The email is $email");
    print("the toke used for extraction $token");

    return email;
  }

  Future<String?> getToken() async {
    /**
     * this function look for the token and retrieve it if it is not
     * yet deleted from the user storage
     */
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<String?> login(String email, String password) async {
    /**
     * 
     * @email
     * @password
     * 
     * It created an object , encode it and send it to 
     * http://10.0.2.2:8850/api/v1/auth/authenticate
     */
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8850/api/v1/auth/authenticate'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['refreshToken'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);

      return token;
    } else {
      throw Exception('Failed to login ${response.statusCode} ');
    }
  }

  Future<void> logout() async {
    /**
     * This logs out the user 
     * It deletes the token stored
     */
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
