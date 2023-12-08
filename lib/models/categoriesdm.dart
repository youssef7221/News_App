import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/models/sources.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDm  {
Color color ;
String categoryImage ;
String categoryName;
String categoryId;
CategoryDm(this.color , this.categoryImage , this.categoryName ,this.categoryId );
static List<CategoryDm> getCategoryies(BuildContext context){
  return  [
    CategoryDm(Color(0xffC91C22), "assets/ball.png",AppLocalizations.of(context)!.sports,"sports"),
    CategoryDm(Color(0xff003E90), "assets/Entertainment.png", AppLocalizations.of(context)!.entertaiment,"entertainment"),
    CategoryDm(Color(0xffED1E79), "assets/health.png", AppLocalizations.of(context)!.health,"health"),
    CategoryDm(Color(0xffCF7E48), "assets/bussines.png", AppLocalizations.of(context)!.business,"business"),
    CategoryDm(Color(0xff4882CF), "assets/Global.png", AppLocalizations.of(context)!.general,"general"),
    CategoryDm(Color(0xffF2D352), "assets/science.png", AppLocalizations.of(context)!.science,"science"),
    CategoryDm(Color(0xff17805D), "assets/Technology.png", AppLocalizations.of(context)!.technology,"technology"),
    CategoryDm(Colors.brown, "assets/All.png", AppLocalizations.of(context)!.all,""),

  ];
}
}
