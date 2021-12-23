
import 'package:flutter/widgets.dart';
import 'package:mvvm_buildrealproject/Model/FavouritModel.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';

class FavoriteProvider with ChangeNotifier{
  Map<String, FavouritModel>_favouritItems={};
  Map<String, FavouritModel> get getFavouriteItems{
    return{..._favouritItems};
  }
  void addITemFavorite(
      String title,
      String description,
      )
  {
    if(_favouritItems.containsKey(title)){
      _favouritItems.update
        (title,
              (exitingFavoriteItem)=>FavouritModel(
        title: exitingFavoriteItem.title,
        description:exitingFavoriteItem.description
      )
      );
    }else {_favouritItems.putIfAbsent(
        title,
        ()=>FavouritModel(
          title:title,
          description: description
        )
    );
  }
    notifyListeners();
  }
  void removeItem(String title){
    _favouritItems.remove(title);
    notifyListeners();
  }
void clearItems(){
    _favouritItems.clear();
    notifyListeners();
}
}
