import 'package:flutter/cupertino.dart';

class FavouritModel with ChangeNotifier{
  final String title;
  final String description;

  FavouritModel({this.title,this.description});
}