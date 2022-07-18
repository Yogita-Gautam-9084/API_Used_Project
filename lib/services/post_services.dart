import 'dart:convert';

import 'package:http/http.dart' as http;

class PostServices {
  String baseUrl = "https://reqres.in/api/user?page=2";
  Future<List> getPosted() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        return Future.error('Server Error!');
      }
    } catch (SocketException) {
      return Future.error('Error Fetching Data!');
    }
  }
}
