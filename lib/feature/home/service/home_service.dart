import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeService {
  static Future<dynamic> getPost() async {
    try {
      String url = "https://jsonplaceholder.typicode.com/posts";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      return null;
    }
  }
}
