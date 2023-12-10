import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/sources.dart';

class ApiManager{
 static Future<SourceDataModel> getsources(String sourceCateg) async{
    Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",
    {
      "apikey":"90183199873a4d0daa6cafad23cc591c",
      "category" : sourceCateg
    });
   http.Response response =await http.get(url);
   var jsonData = jsonDecode(response.body);
    SourceDataModel sourceResponce = SourceDataModel.fromJson(jsonData);
   return sourceResponce;
  }

  static Future<NewsData> getarticles(String sourceId ) async{
     Uri url = Uri.https("newsapi.org","/v2/everything",
     {
       "apikey":"90183199873a4d0daa6cafad23cc591c",
       "sources": sourceId,
     });
  http.Response response =await http.get(url);
  var jsonData = jsonDecode(response.body);
  NewsData newsData = NewsData.fromJson(jsonData);
  return newsData ;
  }
}