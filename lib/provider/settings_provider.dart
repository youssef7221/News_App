import 'package:flutter/material.dart';
import 'package:news_app/shared_pref/shared_pref.dart';

class settingsProvider extends ChangeNotifier{
  String currentLocale = "en";
  bool isSearch = false;
  bool get shouldsearch => isSearch;
  bool isArEnabled ()=> SharedPref.getData(key:"language");
  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    print("Language saved ${currentLocale}");
    notifyListeners();
  }


  void setSearch(bool newIsSearch){
    isSearch = newIsSearch;
    notifyListeners();
  }
}