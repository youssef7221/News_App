import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/categoriesdm.dart';

class CategoryItem extends StatelessWidget {
  int index ;
  List<CategoryDm> categoryDm ;
  CategoryItem(this.index ,this.categoryDm);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDm[index].color,
          borderRadius: BorderRadius.only(
          bottomLeft: index % 2 ==0 ? Radius.circular(0) : Radius.circular(25),
          bottomRight:index % 2!=0? Radius.circular(0) : Radius.circular(25),
          topLeft:  Radius.circular(25),
          topRight:  Radius.circular(25)
        )
      ),
      height: 200,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryDm[index].categoryImage,width: 100,height: 102,)),
          Text(categoryDm[index].categoryName,style: GoogleFonts.exo(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400
          ),)
        ],
      ),
    );
  }
}
