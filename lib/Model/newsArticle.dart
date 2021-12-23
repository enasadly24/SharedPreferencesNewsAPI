import 'package:flutter/material.dart';

class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({this.title,this.description,this.urlToImage,this.url});
  // creat new instance of newsarticle class
  factory NewsArticle.fromJson(Map<String, dynamic> json){
    return NewsArticle(
      title: json["title"],
      description: json["description"],
      urlToImage: json["urlToImage"],
      url: json["url"]
    );
  }

}