import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  // Private constructor
  Api._singleton();

  // The one and only instance
  static final Api _instance = Api._singleton();

  // Factory returns the same instance
  factory Api() => _instance;

  // Method with input parameter instead of constructor argument
  Future<String?> sendRequest(String ans) async {
    final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyDuEh3XJjvQuWJgckY6j5MtH472d_-cu3E"
    );
    final headers = {"content-type": "application/json"};
    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": ans}
          ]
        }
      ]
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final answer = data['candidates'][0]['content']['parts'][0]['text'];
      return answer;
    }

    return null;
  }
}
