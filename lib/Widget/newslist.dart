import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Pages/NewsArticleDetailsPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/FAvouritScreen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListNews extends StatefulWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;
  NewsArticleViewModel article;
  ListNews({this.articles, this.onSelected,this.article});
  @override
  _ListNewsState createState() => _ListNewsState(onSelected,articles);
}

class _ListNewsState extends State<ListNews> {
  SharedPreferences prefs;
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  _ListNewsState(this.onSelected,this.articles);
   String storedata;
   bool store;
  void initState(){
    prefinit();
    super.initState();
  }
  Future<String> prefinit()async{
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('data')??"";
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            onTap: () {
              this.onSelected(article);
            },
            leading: Container(
              width: 100,
              height: 100,
              child: article.imagUrl == null
                  ? Image.asset("Images/splash_Logo.png")
                  : Image.network(article.imagUrl),
            ),
            title: Text(articles[index].title),
            trailing: InkWell(
              child: Icon(
                Icons.more_horiz_sharp,
                color: Colors.pink,
              ),
              onTap: ()async{
                showDialog(context: context,
                    builder: (BuildContext context){
                      return GestureDetector(
                        child: Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),

                            ),
                            elevation: 0.0,
                            backgroundColor: Colors.pink,
                            child:SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(article.title),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 10.0,
                                                offset: const Offset(0.0, 10.0),
                                              ),

                                            ],
                                          ),
                                          child: ClipOval(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              /* child: InkWell(
                                                  onTap: (){
                                                    var route=MaterialPageRoute(
                                                        builder: (BuildContext context){
                                                          FavouritScreen(value: article.title);
                                                        });
                                                    Navigator.of(context).push(route);
                                                  },
                                                  child: Icon(
                                                   article.title.isNotEmpty
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color: Colors.red,
                                                    size: 25,
                                                  ),
                                                ),*/
                                              child: InkWell(
                                              child: FavoriteButton(
                                                isFavorite: false,
                                                valueChanged: (_isFavourit){
                                                   _isFavourit=article.title;
                                                   prefs.setString('data', article.title);
                                                   Navigator.push(context, MaterialPageRoute(
                                                       builder: (context)=>FavouritScreen(
                                                         // article:article,
                                                       )/*
                              settings: RouteSettings(
                                  arguments:prefs.setString('data', article.title)
                              ))*/));
                                                },
                                              ),
                                           /*     child: Icon(
                                                      article.title=null
                                                      ? Icons.favorite
                                                      :Icons.favorite_border,
                                                       color: Colors.red,
                                                        size: 25,
                                                ),*/
                                             /*  onTap: (){
                                                prefs.setString('data', article.title);
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context)=>FavouritScreen(
                                                  // article:article,
                                                )*//*
                              settings: RouteSettings(
                                  arguments:prefs.setString('data', article.title)
                              ))*//*));
                                               },*/
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                   /*     onTap: (){
                          prefs.setString('data', article.title);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>FavouritScreen(
                                 // article:article,
                              )*//*
                              settings: RouteSettings(
                                  arguments:prefs.setString('data', article.title)
                              ))*//*));
                        },*/
                      );
                    });
              },
            ),
          );
        });
  }
}

/*class ListNews extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;
  //String value;
  NewsArticleViewModel article;
  ListNews({this.articles, this.onSelected,this.article});
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            onTap: () {
              this.onSelected(article);
            },
            leading: Container(
                width: 100,
                height: 100,
                child: article.imagUrl == null
                    ? Image.asset("Images/splash_Logo.png")
                    : Image.network(article.imagUrl),
            ),
            title: Text(articles[index].title),
                trailing: InkWell(
                  child: Icon(
                    Icons.more_horiz_sharp,
                    color: Colors.pink,
                  ),
                  onTap: ()async{
                    showDialog(context: context,
                        builder: (BuildContext context){
                        return GestureDetector(
                                child: Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),

                              ),
                              elevation: 0.0,
                              backgroundColor: Colors.pink,
                              child:SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article.title,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 10.0,
                                                  offset: const Offset(0.0, 10.0),
                                                ),

                                              ],
                                            ),
                                            child: ClipOval(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                               *//* child: InkWell(
                                                  onTap: (){
                                                    var route=MaterialPageRoute(
                                                        builder: (BuildContext context){
                                                          FavouritScreen(value: article.title);
                                                        });
                                                    Navigator.of(context).push(route);
                                                  },
                                                  child: Icon(
                                                   article.title.isNotEmpty
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color: Colors.red,
                                                    size: 25,
                                                  ),
                                                ),*//*
                                              // child: InkWell(
                                                 child: FavoriteButton(
                                                   isFavorite: false,
                                                   valueChanged: (_isFavourit){
                                                     _isFavourit=article.title;
                                                   },
                                                 ),

                                             //  ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>FavouritScreen(
                                 // article:article,
                                ),
                            settings: RouteSettings(
                              arguments: article.title
                            )));
                          },
                        );
                        });
                  },
                ),
          );
        });
  }
}*/
