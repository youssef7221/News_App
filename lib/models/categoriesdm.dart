import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/models/sources.dart';

class CategoryDm  {
Color color ;
String categoryImage ;
String categoryName;
String categoryId;
CategoryDm(this.color , this.categoryImage , this.categoryName ,this.categoryId );
static List<CategoryDm> getCategoryies(){
  return  [
    CategoryDm(Color(0xffC91C22), "assets/ball.png", "Sports","sports"),
    CategoryDm(Color(0xff003E90), "assets/Entertainment.png", "Entertainment","entertainment"),
    CategoryDm(Color(0xffED1E79), "assets/health.png", "Health","health"),
    CategoryDm(Color(0xffCF7E48), "assets/bussines.png", "Business","business"),
    CategoryDm(Color(0xff4882CF), "assets/Global.png", "General","general"),
    CategoryDm(Color(0xffF2D352), "assets/science.png", "Science","science"),
    CategoryDm(Color(0xff17805D), "assets/Technology.png", "Technology","technology"),
    CategoryDm(Colors.brown, "assets/All.png", "All",""),

  ];
}
}
