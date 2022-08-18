import 'dart:async';
import 'package:api_used_project/models/post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemoteServices{
  Future<Details?> getDetails() async
  {
    var client = http.Client();
  var uri = Uri.parse('https://swapi.dev/api/people/1/');
  var response = await client.get(uri);
   if(response.statusCode == 200)
     {
     var json = response.body;
     if (kDebugMode) {
       print(json);
     }
     return detailsFromJson(json);
     }
   return null;


  }
}