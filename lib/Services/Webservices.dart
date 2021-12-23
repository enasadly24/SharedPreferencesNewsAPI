
import 'dart:convert';
import 'package:dio/dio.dart'as dio;
import 'package:http/http.dart'as http;
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
// resp making network request

// http get actual data


class WebServices{
  Future<List<NewsArticle>> fetchTopHeadLines() async{
    final response= await http.get(Uri.parse(BaseUrl.url));
    if( response.statusCode==200){
     final result= jsonDecode(response.body);
     Iterable list=result["articles"];
     return list.map((article) =>NewsArticle.fromJson(article)).toList();
     // convert to viewmodel to viewed on screen
    }else{
      throw Exception("Failed to get top news");
    }
  }
}