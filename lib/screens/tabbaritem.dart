import 'package:flutter/material.dart';
import 'package:news_app/constants/appcolors.dart';

import '../models/sources.dart';

class TabItem extends StatelessWidget {
  String name;
  TabItem(this.name,this.isSelected);
bool isSelected ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
              width: 2
        ),
          borderRadius: BorderRadius.circular(25), color: isSelected ? AppColors.primary : Colors.transparent),
      child: Center(child: Text(name , style: TextStyle(color:isSelected ? Colors.white : AppColors.primary)
        ,textAlign: TextAlign.center,)),
    );
  }
}
