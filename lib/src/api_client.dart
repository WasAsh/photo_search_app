import 'dart:convert';
import 'package:photo_search_app/src/api_key.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


Future<Map> getPics(String searchTerm) async {
  String myUrl = 'https://pixabay.com/api/?key=${SourceKey.API_KEY}&q=$searchTerm&image_type=photo&pretty=true' ;
  http.Response response = await http.get(myUrl) ;
  return json.decode(response.body) ;
}