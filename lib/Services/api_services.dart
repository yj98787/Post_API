import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:post_api/Models/post_model.dart';

class API {
  static Future<List<Posts>> getPosts() async {
    try {
      Uri requestPath = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(requestPath);

      if (response.statusCode == 200) {
        List<dynamic> decodeResponse = jsonDecode(response.body);
        return decodeResponse.map((data) => Posts.fromJSON(data)).toList();
      } else {
        log("Error: ${response.statusCode}");
        return [];
      }
    } catch (ex) {
      log("Exception: $ex");
      return [];
    }
  }
}
