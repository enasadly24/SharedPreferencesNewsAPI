
import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Model/providers/FavouritProviders.dart';
import 'package:mvvm_buildrealproject/Pages/LoginPage.dart';
import 'package:mvvm_buildrealproject/Pages/newsListPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:provider/provider.dart';

void main()=> runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   /* return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (_)=>NewsArticleListViewModel()..populateTopHeadlines(),
        child: MyForm(),
      )
    );*/

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (_)=>NewsArticleListViewModel()..populateTopHeadlines(),
        ),
        ChangeNotifierProvider<FavoriteProvider>(create: (context)=>FavoriteProvider()),
       // ChangeNotifierProvider<NewsArticleViewModel>(create:(context)=>NewsArticleViewModel())
        //ChangeNotifierProvider<NewsArticle>(create:(context)=>NewsArticle())
      ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fresh News",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyForm(),
    ),
    );
  }
}
