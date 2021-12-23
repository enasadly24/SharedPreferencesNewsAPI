
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*class FavouritScreen extends StatefulWidget {
  //final List<NewsArticleViewModel> articles;
  final String value;
  FavouritScreen({this.value})
  @override
  _FavouritScreenState createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  ListNews listvalues = new ListNews();

  get value => null;
  @override
  Widget build(BuildContext context) {
  //  final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Favourit Page")),
      body: ListTile(
        title: Text("${value}"),
      ),
    );
  }
}*/

class FavouritScreen extends StatefulWidget {
  NewsArticleViewModel article;
  FavouritScreen({this.article});
  @override
  _FavouritScreenState createState() => _FavouritScreenState(article: article);
}

class _FavouritScreenState extends State<FavouritScreen> {
  NewsArticleViewModel article;
  _FavouritScreenState({this.article});
  SharedPreferences StoredData;
  String data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  Future<String> initial()async{
         StoredData= await SharedPreferences.getInstance();
         setState(() {
           data= StoredData.getString('data');
           return data;
         });

  }
  @override
  Widget build(BuildContext context) {
      //String Mydata= ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Favourit Page")),
      body: ListTile(
        title: Text("${data}"),
        trailing: Icon(Icons.favorite, color: Colors.pink,),

      ),
    );
  }
}

/*class FavouritScreen extends StatelessWidget {//final List<NewsArticleViewModel> articles;
  NewsArticleViewModel article;
  FavouritScreen({this.article});
  @override
  Widget build(BuildContext context) {
    final String mydata= ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Favourit Page")),
      body: ListTile(
        title: Text(mydata),
        trailing: Icon(Icons.favorite, color: Colors.pink,),
      ),
    );
  }
}*/

