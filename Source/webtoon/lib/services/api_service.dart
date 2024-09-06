
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoonModel.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';

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


  static Future<WebtoonDetailModel>getToonById(String id) async
  {
    final url = Uri.parse('$baseUrl/$id');

    final response = await http.get(url);
    
    if(response.statusCode ==200)
    {

      final toons = jsonDecode(response.body);
      //WebtoonDetailModel.fromJson(toons);

      return   WebtoonDetailModel.fromJson(toons);
    }else
    {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>>getLatestEpisodesById(String id) async
  {

    List<WebtoonEpisodeModel> episodesInstances =[];
    final url = Uri.parse('$baseUrl/$id/episodes');

    final response = await http.get(url);
    
    if(response.statusCode ==200)
    {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes)
      {
        var epi = WebtoonEpisodeModel.fromJson(episode);
        episodesInstances.add(epi);
      }
      return episodesInstances;
    }
      throw Error();
  }


}