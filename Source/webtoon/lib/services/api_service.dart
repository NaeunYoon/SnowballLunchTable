
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoonModel.dart';

class ApiService
{
  static const String baseUrl ="https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today ="today";
  static List<WebtoonModel> webtoonInstances =[];

  static Future<List<WebtoonModel>> getTodaysToons()async
  {
    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);
    
    if(response.statusCode == 200) {
      print(response.body);
      final List<dynamic> webtoons = jsonDecode(response.body);
      
      for(var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    } 
    else {
      throw Error();
    }
    

  }


}